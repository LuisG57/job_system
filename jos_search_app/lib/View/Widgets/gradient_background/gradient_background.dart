import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class GradientBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.lightBlue, Colors.lightGreen])),
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
        ));
  }
}
