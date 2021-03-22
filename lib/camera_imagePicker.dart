import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyApp extends StatefulWidget {
  @override
  _ImagePicker createState() => _ImagePicker();
}

class _ImagePicker extends State<MyApp> {

  AppBar _appBar = new AppBar(
    title: Text("ImagePicker"),
    centerTitle: true,
  );

  List<Map<String, dynamic>> _iconData;
  final _picker = ImagePicker();

  Future _cameraOn() async => await _picker.getImage(source: ImageSource.camera);
  Future _galleryOn() async => await _picker.getImage(source: ImageSource.gallery);

  @override
  void initState() {
    _iconData = [
      {
        "icon": Icon(Icons.camera_alt),
        "onClick": _cameraOn
      },
      {
        "icon": Icon(Icons.camera),
        "onClick": _galleryOn
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _iconData.map((e) => Container(
                width: 50.0,
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: IconButton(
                  icon: e["icon"],
                  onPressed: e["onClick"],
                  color: Colors.white,
                ),
              )).toList(),
            ),
          ),
        ),
      ),
    );
  }
}