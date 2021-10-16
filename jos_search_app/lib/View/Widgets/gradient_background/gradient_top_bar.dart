import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/feed_screen.dart';
import 'package:jos_search_app/View/Widgets/navigation_bar/navigation_bar.dart';

class GradientTopBar extends StatelessWidget {
  GradientTopBar({this.option = false});
  final option;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(3, 211, 252, 1),
            Color.fromRGBO(30, 232, 104, 1)
          ])),
      width: double.infinity,
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('images/Gradient_topbar_logo_white.png'),
          ),
          Row(
            children: [
              option
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, FeedScreen.routeName);
                          },
                          child: Text(
                            'Inicio',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    )
                  : Text(''),
              CircleAvatar(
                child: Text(
                  'FG',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.lightBlue,
                radius: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 20, right: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Frankelly Guzman'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, NavigationBar.routeName);
                        },
                        child: Text('Log out'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 26),
                child: Text('Poster'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
