import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/screens/login/login_screen.dart';
import 'package:project_places_api_mobile/screens/signup/signup_screen.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool atLogin;

  const AlreadyHaveAnAccountCheck({Key key, this.atLogin = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function press;
    if (this.atLogin) {
      press = () {
        GeneralHelper.navigateToScreen(context, new SignupScreen(), true);
      };
    } else {
      press = () {
        GeneralHelper.navigateToScreen(context, new LoginScreen(), false);
      };
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.atLogin
              ? "Don’t have an Account ? "
              : "Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            this.atLogin ? "Sign Up" : "Login",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
