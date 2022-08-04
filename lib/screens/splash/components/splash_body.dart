import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
            child: Image.network(BACKGROUNDWELCOME),
            width: 400,
            height: 300,
          )
        ])));
  }
}
