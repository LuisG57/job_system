import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/sign_in_screen.dart';
import 'package:jos_search_app/View/Widgets/call_to_action/call_to_action.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background_white_board.dart';
import '../page_details/page_details.dart';
import '../gradient_background/gradient_background.dart';
import '../centered_view/centered_view.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(Column(
      children: [
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: 150,
                child: Image.asset('images/Group16.png'),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NabBarItem("About"),
                  SizedBox(
                    width: 69,
                  ),
                  _NabBarItem('Log in'),
                  SizedBox(
                    width: 69,
                  ),
                  _NabBarItem('Sign up')
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              PageDetails(),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    child: CallToAction('Empezar a buscar!'),
                    onTap: () =>
                        Navigator.pushNamed(context, SignInScreen.routeName),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class _NabBarItem extends StatelessWidget {
  final String title;
  const _NabBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
