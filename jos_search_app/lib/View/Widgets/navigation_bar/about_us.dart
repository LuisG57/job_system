import 'package:flutter/material.dart';
import '../gradient_background/gradient_background_white_board.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(Scaffold(
      body: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/about_us_icon.png'),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: Text('Login')),
                  SizedBox(width: 50),
                  TextButton(onPressed: () {}, child: Text('SignUp'))
                ],
              )
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text('Acerca de Job System Essentials')),
          Text(
              'Somos una Pagina especializada en la búsqueda de empleo en diversas areas para tanto empleos fijos profesionales como freelance, en donde filtramos por categorías y/o competencias las diversas ofertas de trabajo que te esperan y que queremos que aproveches para poder lograr un mejor futuro y una mejor estabilidad. Si eres una empresa puedes tener una cuenta de poster para poder ofrecer ofertas de trabajo para aquellos que esten interesados.'),
          Text('!Lo mejor es que puedes empezar desde ya!'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Quiero buscar'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Quiero publicar'),
              )
            ],
          )
        ],
      )),
    ));
  }
}

//Component (about)1 – 2