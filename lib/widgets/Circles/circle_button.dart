import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color backgroundColor, iconColor;
  final Function onPressed;

  const CircleButton({
    Key key,
    @required this.icon,
    @required this.iconSize,
    @required this.backgroundColor,
    @required this.iconColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Color(0xFF767676),
        onPressed: onPressed,
      ),
    );
  }
}
