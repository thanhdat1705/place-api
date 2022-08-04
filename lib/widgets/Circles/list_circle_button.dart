import 'package:flutter/material.dart';

import '../widgets.dart';

class ListCircleButton extends StatefulWidget {
  final List<CircleButton> icons;

  const ListCircleButton({
    Key key,
    @required this.icons,
  }) : super(key: key);

  @override
  _ListCircleButtonState createState() => _ListCircleButtonState();
}

class _ListCircleButtonState extends State<ListCircleButton> {
  List<CircleButton> icons;
  @override
  void initState() {
    super.initState();
    icons = widget.icons;
  }

  Widget _buildIcon(int index) {
    return Container(
      child: icons[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: icons
          .asMap()
          .entries
          .map((MapEntry map) => _buildIcon(map.key))
          .toList(),
    );
  }
}
