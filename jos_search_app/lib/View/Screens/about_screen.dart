import 'package:flutter/material.dart';
import '../Widgets/navigation_bar/about_us.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static const routeName = '/about_us_screen';

  @override
  Widget build(BuildContext context) {
    return AboutUs();
  }
}
