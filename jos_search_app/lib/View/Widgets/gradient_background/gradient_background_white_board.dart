import 'package:flutter/material.dart';
import './gradient_background.dart';

class GradientBackgroundWhiteBoard extends StatelessWidget {
  Widget widget;

  GradientBackgroundWhiteBoard(this.widget);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      GradientBackGround(),
      Padding(
        padding: EdgeInsets.all(50),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: EdgeInsets.all(50),
              color: Colors.white,
              child: widget,
            )),
      ),
    ]);
  }
}
