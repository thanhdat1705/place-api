import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/screens/signup/components/signup_backgrounds.dart';
import 'package:project_places_api_mobile/shared/shared_components/already_have_an_account_check.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_places_api_mobile/widgets/Circles/circle_button.dart';
import 'package:project_places_api_mobile/widgets/widgets.dart';

class SignupBody extends StatefulWidget {
  SignupBody({Key key}) : super(key: key);

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(childs: <Widget>[
      Text(
        "SIGNUP",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: kPrimaryColor),
      ),
      SizedBox(height: size.height * 0.06),
      Image.network(BACKGROUNDSIGNUPURL),
      SizedBox(height: size.height * 0.07),
      FacebookSignInButton(
          onPressed: () {
            // call authentication logic
          },
          borderRadius: 10,
          text: 'Signup with Facebook',
          centered: true),
      SizedBox(height: size.height * 0.03),
      GoogleSignInButton(
        onPressed: () {
          // call authentication logic
        },
        darkMode: false,
        text: 'Signup with Google   ',
        borderRadius: 10,
        centered: true, // default: false
      ),
      SizedBox(height: size.height * 0.05),
      AlreadyHaveAnAccountCheck(
        atLogin: false,
      )
    ]);
  }
}
