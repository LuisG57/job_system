import 'package:flutter/material.dart';
import '../gradient_background/gradient_background_white_board.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(Scaffold(
      body: Center(
          child: Column(
        children: [
          Row(),
          Container(child: Text('das')),
        ],
      )),
    ));
  }
}
