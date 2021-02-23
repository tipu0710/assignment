import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

enum UniLinksType { string, uri }

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  String _initialLink;
  Uri _initialUri;
  String _latestLink = 'Unknown';
  Uri _latestUri;

  StreamSubscription _sub;


  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  @override
  dispose() {
    if (_sub != null) _sub.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
      await initPlatformStateForStringUniLinks();
  }

  /// An implementation using a [String] link
  Future<void> initPlatformStateForStringUniLinks() async {
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted) return;
      setState(() {
        _latestLink = link ?? 'Unknown';
        _latestUri = null;
        try {
          if (link != null) _latestUri = Uri.parse(link);
        } on FormatException {}
      });
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestLink = 'Failed to get latest link: $err.';
        _latestUri = null;
      });
    });

    // Get the latest link
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialLink = await getInitialLink();
      print('initial link: $_initialLink');
      if (_initialLink != null) _initialUri = Uri.parse(_initialLink);
    } on PlatformException {
      _initialLink = 'Failed to get initial link.';
      _initialUri = null;
    } on FormatException {
      _initialLink = 'Failed to parse the initial link as Uri.';
      _initialUri = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestLink = _initialLink;
      _latestUri = _initialUri;
    });
  }


  @override
  Widget build(BuildContext context) {
    final queryParams = _latestUri?.queryParametersAll?.entries?.toList();

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            new ListTile(
              title: const Text('Initial Link'),
              subtitle: new Text('$_initialLink'),
            ),
            new ListTile(
              title: const Text('Link'),
              subtitle: new Text('$_latestLink'),
            ),
            new ListTile(
              title: const Text('Uri Path'),
              subtitle: new Text('${_latestUri?.path}'),
            ),
            new ExpansionTile(
              initiallyExpanded: true,
              title: const Text('Query params'),
              children: queryParams?.map((item) {
                return new ListTile(
                  title: new Text('${item.key}'),
                  trailing: new Text('${item.value?.join(', ')}'),
                );
              })?.toList() ??
                  <Widget>[
                    new ListTile(
                      dense: true,
                      title: const Text('null'),
                    ),
                  ],
            ),
            new Divider(),
            new ListTile(
              leading: Icon(Icons.error, color: Colors.red),
              title: const Text(
                'Force quit this example app',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // WARNING: DO NOT USE this in production !!!
                //          Your app will (most probably) be rejected !!!
                if (Platform.isIOS) {
                  exit(0);
                } else {
                  SystemNavigator.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }



}
