// * pubspec.yaml
//  flutter_local_notifications: ^1.4.3
//  ( https://pub.dev/packages/flutter_local_notifications )

// * IOS(Objective-C) : Runner > AppDelegate.m
// ...
//  if (@available(iOS 10.0, *)) {
//   [UNUserNotificationCenter currentNotificationCenter].delegate = (id<UNUserNotificationCenterDelegate>) self;
//  }
// return [...];
// }
// @end

// * Android : AndroidManifest.xml
//    <uses-permission android:name="android.permission.INTERNET" />
//    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
//    <uses-permission android:name="android.permission.VIBRATE" />

// <application ... android:usesCleartextTraffic="true"> 
//        <receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
//        <intent-filter>
//        <action android:name="android.intent.action.BOOT_COMPLETED"></action>
//        </intent-filter>
//        </receiver>
//        <receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"/>
// * Android Notification Imag path : android > app > src > main > res > drawable/app_icon.png

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  AndroidNotificationDetails androidNotificationDetails;
  IOSNotificationDetails iosNotificationDetails;
  NotificationDetails notificationDetails;

  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: new Text(title),
            content: new Text(body),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Ok'),
                onPressed: () async {
             Navigator.of(context, rootNavigator: true).pop();
             await Navigator.push(
               context,
               new MaterialPageRoute(
                 // builder: (context) => new SecondScreen(payload),
               ),
             );
                },
              )
            ],
          ),
    );
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
   // await Navigator.push(
   //   context,
   //   new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
   // );
  }

  @override
  void initState() {

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    androidInitializationSettings = new AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification,);
    initializationSettings = new InitializationSettings(androidInitializationSettings, iosInitializationSettings);

    androidNotificationDetails = new AndroidNotificationDetails("chid", "chname", "chdes",);
    iosNotificationDetails = new IOSNotificationDetails();
    notificationDetails = new NotificationDetails(androidNotificationDetails, iosNotificationDetails);

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: selectNotification);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text("바로알림"),
                onPressed: () => flutterLocalNotificationsPlugin.show(
                  0,
                  "알림제목1",
                  "알림본문1",
                  notificationDetails,
                  payload: "알림1을 선택"
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text("초/분/시간/일 후 알림"),
                onPressed: () => flutterLocalNotificationsPlugin.schedule(
                    0,
                    "scheduled title",
                    "scheduled body",
                    new DateTime.now().add(
                      new Duration(seconds: 2)
                    ),
                    notificationDetails,
                  payload: "X초 후 알림을 선택",
                  androidAllowWhileIdle: true
                ),
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.data_usage),
                onPressed: () async{
                  await flutterLocalNotificationsPlugin.show(0, "TITLE", "DES", notificationDetails);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}