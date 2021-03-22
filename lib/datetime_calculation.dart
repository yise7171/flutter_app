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
      drawer: Drawer(),
      body: Container(
        color: Colors.red[200],
        child: Center(
          child: Text(
            "현재일시는 ${new DateTime.now().toString()} 입니다 \n"
            "내일은 ${new DateTime.now().add(Duration(days: 1)).toString()} 입니다 \n"
            "어제는 ${new DateTime.now().subtract(Duration(days: 1)).toString()} 입니다 \n",
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
    );
  }
}