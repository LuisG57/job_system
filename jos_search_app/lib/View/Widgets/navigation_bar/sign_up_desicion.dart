import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/sign_screens/sign_up_screen_poster.dart';
import 'package:jos_search_app/View/Screens/sign_screens/sign_up_screen_searcher.dart';
import '../gradient_background/gradient_background_with_white_board_smaller.dart';

class SignupScreenDesicion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoardSmaller(Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/sign_in_icon.png',
                fit: BoxFit.cover,
              ),
              Text(
                '¿Que desearia realizar?',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 193, 203)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SignUpScreenSearcher.routeName);
                      },
                      child: Text(
                        'Quiero buscar',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SignUpScreenPoster.routeName);
                      },
                      child: Text(
                        'Quiero publicar',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.greenAccent.shade400),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
