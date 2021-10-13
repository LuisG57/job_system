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
          //Extract widget later ----*----*----
          Center(
            child: Container(
              height: 675,
              width: 1400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.asset(
                    'images/post_form_icon.png',
                    height: 400,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
              ),
              Container(
                height: 750,
                width: 950,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
