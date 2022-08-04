import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/home/components/home_map.dart';
import 'package:project_places_api_mobile/screens/information/components/information_body.dart';
import 'package:project_places_api_mobile/screens/information/information_screen.dart';
import 'package:project_places_api_mobile/screens/login/login_screen.dart';
import 'package:project_places_api_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/services/push_notification_manager.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/screens/splash/splash_screen.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Places Information',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: SplashScreen(),
    );
  }
}
