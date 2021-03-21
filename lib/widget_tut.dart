import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget_tutorial'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Text("ListView"),
            ),
            Container(
              //  width: MediaQuery.of(context).size.width,
              height: 150.0,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index){
                    return Container(
                      width: 145.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 5.0
                      ),
                      color: Colors.grey[300],
                      child: Center(
                        child: Text("ListView $index"),
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Text("GridView"),
            ),
            Container(
              height: 300.0,
              child: GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index){
                    return Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text("GridView $index"),
                      ),
                    );
                  }),
            ),
          ],
        )
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