import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'MediaQueryPage';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MediaQueryPage(),
    );
  }
}

class MediaQueryPage extends StatelessWidget {

  const MediaQueryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQueryPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ScreenSize(),
            Image.asset(
              'BulbOn.jpeg',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenSize extends StatelessWidget {
  const ScreenSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isAndroid = Platform.isAndroid;
    bool isiOS = Platform.isIOS;
    var op = Platform.operatingSystem;
    var opVer = Platform.operatingSystemVersion;
    var b = Platform.environment;

    var mediaQuery = MediaQuery.of(context);
    var screenSize = mediaQuery.size;
    var orientation = mediaQuery.orientation;
    var fontScaling = mediaQuery.textScaleFactor;
    var padding = mediaQuery.padding;
    var deviceModel = mediaQuery.platformBrightness;
    var pixelRatio = mediaQuery.devicePixelRatio;
    var disableAnimation = mediaQuery.disableAnimations;
    var platformBrightness = mediaQuery.platformBrightness;

    return Container(
      child: Text(
        '''width = ${(screenSize.width).toStringAsFixed(3)}\n
height = ${(screenSize.height).toStringAsFixed(3)}\n
orientation = ${orientation}\n
textScaleFactor = ${fontScaling}\n
padding = ${padding}\n
disableAnimation = ${disableAnimation}\n
platformBrightness = ${platformBrightness}\n
''',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
