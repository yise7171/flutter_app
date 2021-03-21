import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //json 연결

// pubspec.yaml에 아래 기술하여 install
// dependencies:
//     http: ^0.13.0
// install 방법
// dart pub get
// flutter pub get
// import 방법
// import 'package:http/http.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        centerTitle: true,
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){},
          )
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: FutureBuilder(
          future: fetch(),
          builder: (context, AsyncSnapshot snap){
            return Text(snap.data.toString());
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

Future fetch() async{
  String url = "https://example.com";
  // var res = await http.get(url);
  // return json.decode(res.body);
  return 0;
}
