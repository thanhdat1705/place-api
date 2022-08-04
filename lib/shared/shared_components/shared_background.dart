import 'package:flutter/material.dart';

class SharedBackground extends StatelessWidget {
  final List<Widget> childs;
  const SharedBackground({Key key, @required this.childs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Container(
      height: size.height,
      width: double.infinity,
      child: new Stack(
        alignment: Alignment.center,
        children: this.childs,
      )
    );
  }
}
