import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MyApp extends StatefulWidget {
  @override
  _ShareAppState createState() => _ShareAppState();
}

class _ShareAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("ShareApp"),
      centerTitle: true,
      ),
    body: Center(
      child: RaisedButton(
        child: Text("Share"),
        onPressed: () {
          Share.share(
            "Title",
            subject: "SubTitle",
            sharePositionOrigin: Rect.largest
          );
        },
      )
      ),
    );
  }
}