import 'package:flutter/material.dart';
import './gradient_background.dart';

class GradientBackgroundWhiteBoardSmaller extends StatelessWidget {
  Widget widget;

  GradientBackgroundWhiteBoardSmaller(this.widget);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      GradientBackGround(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
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
