import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/shared_components/shared_background.dart';
class InformationBackground extends StatelessWidget {
  final List<Widget> childs;
  const InformationBackground({Key key, @required this.childs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SharedBackground(
      childs: <Widget>[
        new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: this.childs,
          ),
        ),
      ],
    );
  }
}