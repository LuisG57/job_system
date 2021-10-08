import 'package:flutter/material.dart';
import '../Widgets/gradient_background/gradient_background_white_board.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static const routeName = '/about_us_screen';

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(Text('das'));
  }
}
