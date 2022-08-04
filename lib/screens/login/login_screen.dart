import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/login/components/login_body.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginBody(),
    );
  }
}
