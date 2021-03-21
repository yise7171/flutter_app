import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("CustomScroll & SliverScroll"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, int index) => Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 16.0
                  ),
                  child: Text("List Item $index"),
                ),
              childCount: 20,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
            delegate: SliverChildBuilderDelegate(
              (context, int index) => Container(
                child: Center(
                  child: Text("Item $index"),
                ),
              ),
              childCount: 20
            ),
          )
        ],
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

