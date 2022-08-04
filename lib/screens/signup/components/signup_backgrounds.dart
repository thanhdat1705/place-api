import 'package:flutter/cupertino.dart';
import 'package:project_places_api_mobile/shared/shared_components/shared_background.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';

class SignupBackground extends StatelessWidget {
  final List<Widget> childs;
  const SignupBackground({Key key, @required this.childs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SharedBackground(childs: <Widget>[
      new Positioned(
        top: 0,
        left: 0,
        child: Image.network(
          TEMPLATETOPLEFT2,
          width: size.width * 0.35,
        ),
      ),
      new Positioned(
        bottom: 0,
        left: 0,
        child: Image.network(
          TEMPLATEBOTTOMLEFT,
          width: size.width * 0.4,
        ),
      ),
      new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: this.childs,
        ),
      ),
    ]);
    // new Positioned(
    //   bottom: 0,
    //   left: 0,
    //   child: Image.network(
    //     TEMPLATEBOTTOMLEFT,
    //     width: size.width * 0.2,
    //   ),
    // ),
    // new SingleChildScrollView(
    //   child: new Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: this.childs,
    //   ),
    // ),
    //]
    //);
  }
}
