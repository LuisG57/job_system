import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/sign_in_screen.dart';
import 'package:jos_search_app/View/Screens/sign_screens/sign_up_screen_poster.dart';
import 'package:jos_search_app/View/Screens/sign_screens/sign_up_screen_searcher.dart';
import 'package:jos_search_app/View/Screens/sign_up_screen.dart';
import '../gradient_background/gradient_background_white_board.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(
      Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 75,
                        child: Image.asset('images/about_us_icon.png')),
                    Row(
                      children: [
                        Text(
                          'Acerca de nosotros',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
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
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
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
                Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      'Acerca de Job Essentials',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          height: 0.9,
                          fontSize: 40),
                    )),
                Text(
                  'Somos una Pagina especializada en la búsqueda de empleo en diversas areas para tanto empleos fijos profesionales como freelance, en donde filtramos por categorías y/o competencias las diversas ofertas de trabajo que te esperan y que queremos que aproveches para poder lograr un mejor futuro y una mejor estabilidad. Si eres una empresa puedes tener una cuenta de poster para poder ofrecer ofertas de trabajo para aquellos que esten interesados.',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '!Lo mejor es que puedes empezar desde ya!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          'Empezar a buscar!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
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
                          'Empezar a ofrecer!',
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
      ),
    );
  }
}

//Component (about)1 – 2