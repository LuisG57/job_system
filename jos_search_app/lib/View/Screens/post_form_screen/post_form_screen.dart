import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';

class PostFormScreen extends StatelessWidget {
  const PostFormScreen({Key? key}) : super(key: key);
  static const routeName = '/post-form-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBackGround(),
          Center(
            child: Container(),
          )
        ],
      ),
    );
  }
}
