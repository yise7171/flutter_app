import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [false,false,true];
    List<String> dropdownList = ["DropdownButton","1","2","3"];
    int savePoint = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Button List'),
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
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                child: Center(
                  child: RaisedButton(
                    child: Text("RaiseButton"),
                    onPressed: (){},
                  ),
                ),
              ),
              Container(
                child: BackButton(),
              ),
              Container(
                child: CloseButton(),
              ),
              Container(
                child: FloatingActionButton(
                  child: Icon(Icons.check),
                  onPressed:(){},
                ),
              ),
              Container(
                child: Center(
                  child: OutlineButton(
                    child: Text("OutLineButton"),
                    onPressed:(){},
                  ),
                ),
              ),
              Container(
                child: RawMaterialButton(
                  child: Text("RawMaterialButton"),
                  onPressed:(){},
                ),
              ),
              Container(
                child: Center(
                  child: ToggleButtons(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Icon(Icons.call),
                      Icon(Icons.cake),
                    ],
                    onPressed: (int index) {
                      setState(isSelected, index);},
                    isSelected: isSelected,
                  ),
                ),
              ),
              Container(child: CupertinoButton(
                child: Text("CupertinoButton"),
                onPressed: (){},
                )
              ),
              Container(
                child: Center(
                  child: PopupMenuButton(
                    child: Text("PopUp"),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("선택버튼1"),
                        value: "PopupMenuItem1",
                      ),
                      PopupMenuItem(
                        child: Text("선택버튼2"),
                        value: "PopupMenuItem2",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: DropdownButton(
                    hint: Text(dropdownList[savePoint]),
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text("1"),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text("2"),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text("3"),
                      ),
                    ],
                    onChanged: (int value){
                      savePoint = value;},
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: MaterialButton(
                    child: Text("MaterialButton"),
                    onPressed: (){},
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text("InkWell"),
                    ),
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tap')));},
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: GestureDetector(
                    child: Text("GestureDetector"),
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tap')));},
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: FlatButton(
                    child: Text("FlatButton"),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
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

void setState(List<bool> isSelected, int index) {
  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
    if (buttonIndex == index) {
      isSelected[buttonIndex] = true;
    } else {
      isSelected[buttonIndex] = false;
    }
  }
}