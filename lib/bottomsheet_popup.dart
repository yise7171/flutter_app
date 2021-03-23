// showModalBottomSheet
// 특정상황 또는 입력에 따라 사용자에게 하단에서 올라오는 알림창으로 사용
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  String data;
  MyApp({@required this.data});

  @override
  _BottomSheetPopup createState() => _BottomSheetPopup();
}

class _BottomSheetPopup extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("BottomModalPage"),
    centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                child: Text("showModalBottomSheet 1"),
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            child: Text("닫기", style: TextStyle(color: Colors.red),),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text("BottomSheet Notfication 1",),
                        ],
                      ),
                    )
                ),
              ),
              InkWell(
                child: Text("showModalBottomSheet 2"),
                onTap: () => showBottomNotification(context:context),
              ),
              InkWell(
                child: Text("IOS showModalBottomSheet 3"),
                onTap: () => iosShowBottomNotification(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  showBottomNotification({BuildContext context}){
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height*0.1,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("닫기", style: TextStyle(color: Colors.red),),
                onPressed: () => Navigator.pop(context),
              ),
              Text("BottomSheet Notfication 2",),
            ],
          ),
        )
    );
  }

  iosShowBottomNotification(BuildContext context){
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text("시트1"),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text("액션1"),
            onPressed: () => print("액션1"),
          ),
          CupertinoActionSheetAction(
            child: Text("액션2"),
            onPressed: () => print("액션2"),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("닫기"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}