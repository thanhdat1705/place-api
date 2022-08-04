import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final String buttonName;
  final Color containerColor;
  final double sizeContainerButton;
  final double buttonFontSize;
  final Color buttonFontColor;
  final Function onPressed;
  final AnimationController controller;
  final Color normalButtonColor;
  final Color onPressedButtonColor;
  const ColorButton({
    Key key,
    @required this.buttonName,
    this.containerColor,
    @required this.sizeContainerButton,
    this.buttonFontSize,
    this.buttonFontColor,
    @required this.controller,
    @required this.onPressed,
    @required this.normalButtonColor,
    @required this.onPressedButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: this.sizeContainerButton,
      color: this.containerColor,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        child: Text(
          buttonName,
          style: TextStyle(
            color: this.buttonFontColor,
            fontSize: this.buttonFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        animation: this.controller,
        builder: (BuildContext context, Widget child) {
          return new RaisedButton(
            color: new ColorTween(
              begin: this.normalButtonColor,
              end: this.onPressedButtonColor,
            ).animate(this.controller).value,
            child: child,
            onPressed: this.onPressed,
          );
        },
      ),
    );
  }
}
