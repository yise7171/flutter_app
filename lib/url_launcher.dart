// http:<URL> , https:<URL>  브라우저에 URL 열기
// e.g. http://flutter.dev
// mailto:<email address>?subject=<subject>&body=<body> email 생성
// e.g. mailto:smith@example.org?subject=News&body=New%20plugin
// tel:<phone number>  핸드폰 걸기
// e.g. tel:+1 555 010 999
// sms:<phone number>  SMS 메시지 보내기
// e.g. sms:5550101234

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatefulWidget {
  @override
  _OtherSharePage createState() => _OtherSharePage();
}

class _OtherSharePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShareApp"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Tel:"),
              onPressed: () => otherShare("tel:010-1234-1234"),
            ),
            RaisedButton(
              child: Text("Mail:"),
              onPressed: () => otherShare("mailto:abcd@naver.com"),
            ),
            RaisedButton(
              child: Text("SMS:"),
              onPressed: () => otherShare("sms:010-1234-1234"),
            ),
            RaisedButton(
              child: Text("Web:"),
              onPressed: () => otherShare("https://google.com"),
            ),
          ],
        ),
      ),
    );
  }

  void otherShare([String contents]) async {
    if(await canLaunch(contents))
      await launch(contents);
    else
      throw "Could not launch $contents";
  }
}