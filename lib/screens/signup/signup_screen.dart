import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/screens/signup/components/signup_body.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SignupBody(),
       //child: child,
    );
  }
}