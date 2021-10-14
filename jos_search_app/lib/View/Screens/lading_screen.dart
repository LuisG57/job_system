import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

// import '../Widgets/table_item.dart';
// import '../Widgets/custom_divider.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/post_job_button.dart';
import '../Widgets/primary_button.dart';
import '../Widgets/navigation_bar/navigation_bar.dart' as nb;

class LandingScreen extends StatelessWidget {
  static const routeName = '/';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(body: nb.NavigationBar());
  }
}
