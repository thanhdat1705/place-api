import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  static FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  static NotificationDetails platformChannelSpecifics;
  static bool _initialized = false;
  //final FirebaseInAppMessaging _firebaseInAppMessaging = new FirebaseInAppMessaging();
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  static String firebaseMessageToken;
  static Future<String> initFirebaseMessaging() async {
    if (!_initialized) {
      //await Firebase.initializeApp();

      AndroidInitializationSettings initializationSettingsAndroid =
          new AndroidInitializationSettings('@mipmap/ic_launcher');
      //var initializationSettingsIOS = new IOSInitializationSettings();
      //final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
      //final MacOSInitializationSettings initializationSettingsMacOS = MacOSInitializationSettings();
      InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: selectNotification);
      //_firebaseInAppMessaging.setMessagesSuppressed(false);

      //await flutterLocalNotificationsPlugin.show(0, 'plain title', 'plain body', platformChannelSpecifics, payload: 'item x');
      // For iOS request permission first.
      //_firebaseMessaging.requestNotificationPermissions();
      //_firebaseMessaging.configure();
      //String deviceid = await DeviceId.getID;
      // For testing purposes print the Firebase Messaging token
      firebaseMessageToken = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $firebaseMessageToken");
      //print("deviceid: $deviceid");
      _initialized = true;
      return firebaseMessageToken;
    }
    return await _firebaseMessaging.getToken();
  }

  static Future<void> show(
      {@required String title, @required String body, String payload}) {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails('com.places-information',
            'Places Information', 'Places Information',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    return flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  static Future selectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    //);
  }
}
