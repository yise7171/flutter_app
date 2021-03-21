import 'package:flutter/material.dart';

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
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation){
            return Text("회전감지값: ${orientation.toString()}");
          },
        ),
      ),
    );
  }
}