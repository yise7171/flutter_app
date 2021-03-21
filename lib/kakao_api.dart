import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopo Demo',
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String addressJSON = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kopo Package_kakao'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.addressJSON),
            RaisedButton(
              child: Text("주소검색"),
              onPressed: () async{
                KopoModel result = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Kopo()
                  ),
                );
                print(result.toJson());
                if(result != null){
                  setState(() {
                    this.addressJSON =
                      '${result.address} ${result.buildingName}${result.apartment == 'Y' ? '아파트' : ''} ${result.zonecode} ';
                  });
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}