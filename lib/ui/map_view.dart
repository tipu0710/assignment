import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:assignment/models/location_model.dart';
import 'package:assignment/services/api_service.dart';
import 'package:assignment/utils/map_helper.dart';
import 'package:assignment/utils/marker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni_links/uni_links.dart';
import '../global.dart';
import 'dart:ui' as ui;

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String _mapStyle;
  StreamSubscription _sub;
  String image;

  GlobalKey _iconKey = GlobalKey();
  GlobalKey _positionKey = GlobalKey();
  GlobalKey _arrowKey = GlobalKey();
  Set<Marker> _markers = {};

  BitmapDescriptor _arrow;
  BitmapDescriptor _marker;
  BitmapDescriptor _positionMar;

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _usaPosition = CameraPosition(
    target: LatLng(38.8935128, -77.1546602),
    zoom: 14.4746,
  );

  LatLng _positionInfo;
  LatLng _initPos = LatLng(38.8935128, -77.1546602);

  @override
  initState() {
    super.initState();
    initPlatformStateForStringUniLinks();
    rootBundle.loadString('assets/sliver_mode.json').then((string) {
      _mapStyle = string;
    });
  }

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
          positionWidget(image: image),
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
                  initialCameraPosition: _usaPosition,
                  myLocationButtonEnabled: false,
                  markers: _markers,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) async {
                    await cookMarker();
                    setState(() {
                      _controller.complete(controller);
                      controller.setMapStyle(_mapStyle);
                      _markers.add(Marker(
                          anchor: Offset(1, 1),
                          markerId: MarkerId("USA"),
                          position: _initPos,
                          icon: _marker));
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

  Future cookMarker() async{
    if (_marker == null || _arrow == null || _positionMar == null) {
      await Future.delayed(Duration(seconds: 1));
      _marker = await getCustomIcon(_iconKey);
      _arrow = await getCustomIcon(_arrowKey);
      _positionMar = await getCustomIcon(_positionKey);
    }
  }

  RepaintBoundary initWidget() {
    double width = 50.0;
    return RepaintBoundary(
      key: _iconKey,
      child: CustomPaint(
        size: Size(width, (width * 1.25).toDouble()),
        painter: UsaMarker(),
      ),
    );
  }

  RepaintBoundary positionWidget({String image}) {
    return RepaintBoundary(
      key: _positionKey,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.grey),
          image: DecorationImage(
              image: image == null
                  ? AssetImage("assets/user.png")
                  : MemoryImage(base64Decode(image)),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  RepaintBoundary arrowWidget() {
    return RepaintBoundary(
        key: _arrowKey,
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

  Future<void> initPlatformStateForStringUniLinks() async {
    _sub = getLinksStream().listen((String link) {
      if (!mounted) return;
      processData(link);
    }, onError: (Object err) {
      print(err);
    });

    // Get the latest link
    // Platform messages may fail, so we use a try/catch.
    try {
      processData(await getInitialLink());
    } catch (e) {
      print(e);
    }
  }

  Future<void> _goToTheLocation(CameraPosition location) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(location));
  }

  void processData(String link) async {
    if (link != null && mounted) {
      Uri _latestUri = Uri.parse(link);
      final queryParams = _latestUri?.queryParametersAll?.entries?.toList();
      Map<String, dynamic> map = new Map<String, dynamic>();
      queryParams.forEach((element) {
        map[element.key] = element.value.first;
      });

      Results results =
          await MapHelper.getLocation(map['city'], map['country']);
      _positionInfo =
          LatLng(results.geometry.location.lat, results.geometry.location.lat);
      await cookMarker();
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId("loc"),
            anchor: Offset(.5, .5),
            position: _positionInfo,
            icon: _positionMar));
        _markers.add(Marker(
            markerId: MarkerId("arrow"),
            position: _positionInfo,
            anchor: Offset(-.9, .5),
            rotation: -90 - MapHelper.getAngle(_initPos, _positionInfo),
            icon: _arrow));
      });
      _goToTheLocation(CameraPosition(
        target: LatLng(
            results.geometry.location.lat, results.geometry.location.lat),
        zoom: 14.4746,
      ));
      getImage(map['id']);
    }
  }

  @override
  dispose() {
    if (_sub != null) _sub.cancel();
    super.dispose();
  }

  void getImage(String code) async {
    if (code == null || code.isEmpty) return;
    print(code);
    Response response = await ApiService.getMethod(
        "https://onecalltest.tfp.com.my:$code/api/Home/DemoApi/GetCustomer/");
    setState(() {
      image = getImageString(response.data['Data']);
      print("image set");
    });

    Future.delayed(Duration(seconds: 1), ()async{
      _positionMar = await getCustomIcon(_positionKey);
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId("loc"),
            anchor: Offset(.5, .5),
            position: _positionInfo,
            icon: _positionMar));
      });
    });
  }
}
