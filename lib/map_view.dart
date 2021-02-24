import 'dart:async';
import 'dart:typed_data';
import 'package:assignment/location_model.dart';
import 'package:assignment/map_helper.dart';
import 'package:assignment/marker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geodesy/geodesy.dart' as gds;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni_links/uni_links.dart';
import 'global.dart';
import 'dart:ui' as ui;

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String _initialLink;
  Uri _initialUri;
  Uri _latestUri;
  String _mapStyle;
  StreamSubscription _sub;

  GlobalKey iconKey = GlobalKey();
  GlobalKey positionKey = GlobalKey();
  GlobalKey arrowKey = GlobalKey();
  Set<Marker> _markers = {};

  BitmapDescriptor arrow;
  BitmapDescriptor marker;
  BitmapDescriptor positionMar;

  RepaintBoundary v;

  @override
  initState() {
    super.initState();
    initPlatformStateForStringUniLinks();
    rootBundle.loadString('assets/sliver_mode.json').then((string) {
      _mapStyle = string;
    });
  }

  @override
  dispose() {
    if (_sub != null) _sub.cancel();
    super.dispose();
  }

  /// An implementation using a [String] link
  Future<void> initPlatformStateForStringUniLinks() async {
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      print("Enter");
      if (!mounted) return;
      setState(() {
        _latestUri = null;
        try {
          if (link != null) {
            _latestUri = Uri.parse(link);
            final queryParams =
                _latestUri?.queryParametersAll?.entries?.toList();
            queryParams.forEach((element) {
              print(element);
            });
          } else {
            print("Null");
          }
        } on FormatException {}
      });
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestUri = null;
      });
    });

    // Get the latest link
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialLink = await getInitialLink();
      print('initial link: $_initialLink');
      if (_initialLink != null && mounted) {
        _initialUri = Uri.parse(_initialLink);
        setState(() {
          _latestUri = _initialUri;
        });
        final queryParams = _latestUri?.queryParametersAll?.entries?.toList();
        Map<String, dynamic> map = new Map<String, dynamic>();
        queryParams.forEach((element) {
          map[element.key] = element.value.first;
        });

        Results results =
            await MapHelper.getLocation(map['city'], map['country']);
        positionInfo = LatLng(
            results.geometry.location.lat, results.geometry.location.lat);
        setState(() {
          _markers.add(Marker(
              markerId: MarkerId("loc"),
              anchor: Offset(.5, .5),
              position: LatLng(
                  results.geometry.location.lat, results.geometry.location.lat),
              icon: positionMar));
          _markers.add(Marker(
              markerId: MarkerId("arrow"),
              position: positionInfo,
              anchor: Offset(-.9, .5),
              rotation: -90-MapHelper.getAngle(initPos, positionInfo),
              icon: arrow));
          print(_markers.length);
        });
        _goToTheLocation(CameraPosition(
          target: LatLng(
              results.geometry.location.lat, results.geometry.location.lat),
          zoom: 14.4746,
        ));
      }
    } on PlatformException {
      _initialLink = 'Failed to get initial link.';
      _initialUri = null;
    } on FormatException {
      _initialLink = 'Failed to parse the initial link as Uri.';
      _initialUri = null;
    }
  }

  Future<void> _goToTheLocation(CameraPosition location) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(location));
  }

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.8935128, -77.1546602),
    zoom: 14.4746,
  );

  LatLng positionInfo;
  LatLng initPos = LatLng(38.8935128, -77.1546602);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finder'),
        centerTitle: true,
        leading: Container(),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          initWidget(),
          positionWidget(),
          arrowWidget(),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  markers: _markers,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) async {
                    if (marker == null) {
                      marker = await getCustomIcon(iconKey);
                      arrow = await getCustomIcon(arrowKey);
                      positionMar = await getCustomIcon(positionKey);
                    }
                    setState(() {
                      _controller.complete(controller);
                      controller.setMapStyle(_mapStyle);
                      _markers.add(Marker(
                          anchor: Offset(1, 1),
                          markerId: MarkerId("ffff"),
                          position: initPos,
                          icon: marker));
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  RepaintBoundary initWidget() {
    double width = 50.0;
    return RepaintBoundary(
      key: iconKey,
      child: CustomPaint(
        size: Size(width, (width * 1.25).toDouble()),
        painter: UsaMarker(),
      ),
    );
  }

  RepaintBoundary positionWidget() {
    return RepaintBoundary(
        key: positionKey,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(width: 2, color: Colors.grey)),
        ));
  }

  RepaintBoundary arrowWidget() {
    return RepaintBoundary(
        key: arrowKey,
        child: CustomPaint(
          size: Size(15, (15 * 1.25).toDouble()),
          painter: ArrowMarker(),
        ));
  }

  Future<BitmapDescriptor> getCustomIcon(GlobalKey iconKey) async {
    Future<Uint8List> _capturePNG(GlobalKey iconKey) async {
      try {
        RenderRepaintBoundary boundary =
            iconKey.currentContext.findRenderObject();
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        var pngBytes = byteData.buffer.asUint8List();
        return pngBytes;
      } catch (e) {
        print(e);
        throw e;
      }
    }

    Uint8List imageData = await _capturePNG(iconKey);
    return BitmapDescriptor.fromBytes(imageData);
  }
}
