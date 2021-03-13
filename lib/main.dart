import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
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
        body: Container(
          color: Colors.red[200],
          child: Center(
              child: Text(
                'Hello, My name is jaekwun lee\n'
                '${(1+1).toString()} 텍스트 위젯',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
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
      ),
    );
  }
}