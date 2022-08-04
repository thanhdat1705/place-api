import 'package:flutter/material.dart';

class Advertising extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        width: 300.0,
        color: Colors.blue,
        child: Stack(
          children: [
            Container(
              height: 210,
              width: 300,
              color: Colors.orange,
            ),
          ],
        ));
  }
}
