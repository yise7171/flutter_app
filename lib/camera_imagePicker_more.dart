
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  _HowToImageInFlutterState createState() => _HowToImageInFlutterState();
}

class _HowToImageInFlutterState extends State<MyApp> {

  GlobalKey<ScaffoldState> _sKey = new GlobalKey<ScaffoldState>();
  List<PickedFile> userImages = [];
  int userBestImageIndex = 0;
  ScrollController controller;
  final _picker = ImagePicker();

  @override
  void initState() {
    controller = new ScrollController()..addListener((){
      setState(() {
        this.iconView();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ImagePicker ++"),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Stack(
                    children : <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          child: this.userImages.isEmpty
                              ? Center(
                              child: Text("이미지를 등록해주세요 !")
                          )
                              : ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              scrollDirection: Axis.horizontal,
                              controller: this.controller,
                              itemCount: this.userImages.length,
                              itemBuilder: (BuildContext context, int index) => Stack(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        userBestImageIndex = index;
                                      });
                                    },
                                    child: Container(
                                      width: 200.0,
                                      child: Card(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                          clipBehavior: Clip.antiAlias,
                                          borderOnForeground: false,
                                          child: Image.file(
                                            File(this.userImages[index].path),fit: BoxFit.cover,
                                            color: index == userBestImageIndex
                                                ? Colors.red[200]
                                                : null,
                                            colorBlendMode: BlendMode.overlay,
                                          )
                                      ),
                                      padding: EdgeInsets.all(10.0),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          userImages.remove(userImages[index]);
                                          iconCountCheck();
                                        });
                                      },
                                      child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          margin: EdgeInsets.all(5.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(30.0)
                                          ),
                                          child: Center(
                                              child: Icon(Icons.close,size: 20.0,color: Colors.white,)
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          )
                      ),
                      !this.nextIconView
                          ? Container()
                          : Positioned(
                        top: 100.0,
                        right: 10.0,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Icon(Icons.navigate_next),
                        ),
                      ),
                    ]
                ),
                Container(
                  width: 130.0,
                  child: MaterialButton(
                    color: this.userImages.length >= 3
                        ? Colors.white
                        : Colors.red,
                    elevation: this.userImages.length >= 3
                        ? 0
                        : 2.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.camera,
                          color: this.userImages.length >= 3
                              ? Colors.red
                              : Colors.white,
                        ),
                        Text(
                          this.userImages.length >= 3
                              ? "최대"
                              : "등록",
                          style: TextStyle(
                            color: this.userImages.length >= 3
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: this.userImages.length >= 3
                        ? () => _sKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("이미지는 최대 3개까지 등록 가능합니다 :)"),
                        duration: Duration(seconds: 2),
                      ),
                    )
                        : () async{
                      bool check = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("카메라 또는 갤러리를 통해 업로드할 수 있습니다"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("촬영"),
                                onPressed: () => Navigator.of(context).pop(true),
                              ),
                              FlatButton(
                                child: Text("앨범"),
                                onPressed: () => Navigator.of(context).pop(false),
                              ),
                              FlatButton(
                                child: Text("취소"),
                                onPressed: () async => Navigator.of(context).pop(null),
                              ),
                            ],
                          )
                      ) ?? null;
                      if(check == null) return;
                      if(check) this.userImages.add(await _picker.getImage(source: ImageSource.camera));
                      else{
                        this.userImages.add(await _picker.getImage(source: ImageSource.gallery));
                      }
                      iconCountCheck();
                      return setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 130.0,
                  child: MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.send,
                          color: this.userImages.isEmpty
                              ? Colors.grey
                              : Colors.white,
                        ),
                        Text(
                          "전송",
                          style: TextStyle(
                              color: this.userImages.isEmpty
                                  ? Colors.grey
                                  : Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    onPressed: this.userImages.isEmpty
                        ? null
                        : () async{
                      List<String> base64List = [];
                      this.userImages.forEach(
                              (e) => base64List.add(base64Encode(File(e.path).readAsBytesSync()))
                      );
                      Map<String, String> header = {
                        "Content-Type" : "apllication/json",
                        "User-Agent" : "Android"
                      };
                      String body = json.encode({ "userPick":this.userBestImageIndex, "images" : base64List});
                      try{
                        await http.post(
                            //변경 필요
                            Uri(
                              host : "http://END",
                              port: 3000,
                              path: "path",
                            ),
                            headers: header,
                            body: body
                        );
                      }
                      catch(e){
                        print("NET ERR");
                      }
                      print(base64List.length);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool nextIconView = false;

  void iconCountCheck(){
    if(this.userImages.length >= 2){
      nextIconView = true;
      return;
    }
    nextIconView = false;
    return;
  }
  void iconView(){
    if(controller.offset >= controller.position.maxScrollExtent){
      nextIconView = false;
    }
    else{
      nextIconView = true;
    }
    return;
  }
}