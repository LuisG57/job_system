import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background_white_board.dart';

class SignUpScreenPoster extends StatelessWidget {
  const SignUpScreenPoster({Key? key}) : super(key: key);
  static const routeName = '/sign-up-poster';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBackGround(),
          Container(
            height: 700,
            width: 1300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.blue, Colors.green])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'images/Icon_Sign_Up.png',
                      height: 550,
                      width: 250,
                    ),
                  ),
                ),
                Container(
                  height: 700,
                  width: 950,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Text(
                        'Bienvenido(a),\nAyudanos a conocerte mejor.',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            height: 0.9,
                            fontSize: 48),
                      ),
                      Form(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Nombre'),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Apellido'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 350,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Correo Electronico'),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 250,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Contraseña'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 350,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Numero de Teléfono'),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 250,
                                  child: DropdownButtonFormField(
                                    items: [
                                      DropdownMenuItem(
                                          child: Text(
                                              'Categoria')) //we need to figure out how to include more than one dropdown item
                                    ],
                                    decoration:
                                        InputDecoration(hintText: 'Categoria'),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                width: 600,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Descripcion...',
                                      border: OutlineInputBorder()),
                                  maxLines: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}