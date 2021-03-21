import 'package:flutter/material.dart';
import 'package:flutter_app/page_tut_sub.dart';

class MyApp extends StatelessWidget {
  String MainValue = "페이지이동";
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
        child: RaisedButton(
          child: Text(this.MainValue),
          onPressed: () async{
            String backValue = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageTwo(data: "Value")
              ),
            );
            print(backValue);
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

