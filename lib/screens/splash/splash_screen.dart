import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/login/login_screen.dart';
import 'package:project_places_api_mobile/screens/splash/components/splash_body.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:project_places_api_mobile/shared/services/push_notification_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new SplashBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    GeneralHelper.delayTimeAndCallback(4, () {
      PushNotificationsManager.initFirebaseMessaging().then((value) {
        GeneralHelper.navigateToScreen(context, LoginScreen(), true);
      });
    });
  }
}
