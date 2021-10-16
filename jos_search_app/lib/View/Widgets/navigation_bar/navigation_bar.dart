import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/about_screen.dart';
import 'package:jos_search_app/View/Screens/sign_in_screen.dart';
import 'package:jos_search_app/View/Screens/sign_up_screen.dart';
import 'package:jos_search_app/View/Widgets/call_to_action/call_to_action.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background_white_board.dart';
import '../page_details/page_details.dart';
import '../gradient_background/gradient_background.dart';
import '../centered_view/centered_view.dart';

class NavigationBar extends StatelessWidget {
  static const routeName = '/navigation-bar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackgroundWhiteBoard(Column(
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
                  children: [
                    Text(
                      'Acerca de nosotros',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 50),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                    SizedBox(width: 50),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Text(
                        'Crear cuenta',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    )
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
      )),
    );
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
