import 'package:flutter/material.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class HeaderProfile extends StatelessWidget {
  final String headerName;
  final double heightContainer;
  final double widthContainer;
  final double widthIcon;
  final double widthText;
  final Color textColor;
  final Function onTap;
  const HeaderProfile({
    Key key,
    @required this.headerName,
    @required this.heightContainer,
    @required this.widthContainer,
    @required this.widthIcon,
    @required this.widthText,
    @required this.textColor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(30),
        bottom: getProportionateScreenHeight(20),
      ),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(15), 0,
                getProportionateScreenWidth(60), 0),
            child: new Container(
              height: heightContainer,
              width: widthContainer,
              child: new InkWell(
                child: new Icon(
                  Icons.arrow_back,
                  size: widthIcon,
                  color: Colors.black,
                ),
                onTap: this.onTap,
              ),
            ),
          ),
          new Container(
            child: Text(
              headerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widthText,
                fontWeight: FontWeight.w900,
                color: this.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
