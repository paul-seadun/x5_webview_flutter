import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:x5_webview/x5_sdk.dart';
import 'package:x5_webview_example/demo.dart';

void main() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    await X5Sdk.init();
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(
                onPressed: () async {
                  var canUseTbsPlayer = await X5Sdk.canUseTbsPlayer();
                  if (canUseTbsPlayer) {
                    var isOk = await X5Sdk.openVideo(
                        "https://ifeng.com-l-ifeng.com/20180528/7391_46b6cf3b/index.m3u8",
                        103);
                  } else {
                    print("x5Video不可用");
                  }
                },
                child: Text("点击打开x5video")),
            RaisedButton(
                onPressed: () async {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context) {
                    return DemoWebViewPage();
                  }));
                },
                child: Text("点击打开x5webview")),
          ],
        ),
      ),
    );
  }
}