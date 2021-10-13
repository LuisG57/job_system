import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/form_widgets/sign_up_button.dart';
import 'package:jos_search_app/View/Widgets/form_widgets/sign_up_text_form_field.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background_white_board.dart';

class SignUpScreenSearcher extends StatelessWidget {
  const SignUpScreenSearcher({Key? key}) : super(key: key);
  static const routeName = '/sign-up-searcher';

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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35.0),
                        child: Text(
                          'Bienvenido(a),\nAyudanos a conocerte mejor.',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 0.9,
                              fontSize: 48),
                        ),
                      ),
                      Expanded(
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignUpTextFormField(
                                      hintText: 'Nombre', Width: 300),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SignUpTextFormField(
                                      hintText: 'Apellido', Width: 300),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignUpTextFormField(
                                      hintText: 'Correo Electronico',
                                      Width: 350),
                                  SignUpTextFormField(
                                      hintText: 'Contraseña', Width: 250),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignUpTextFormField(
                                      hintText: 'Numero de Teléfono',
                                      Width: 350),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    width: 250,
                                    child: DropdownButtonFormField(
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('Categoria'),
                                        ) //we need to figure out how to include more than one dropdown item
                                      ],
                                      decoration: InputDecoration(
                                          hintText: 'Categoria'),
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
                        ),
                      ),
                      SignUpButton(buttonText: 'Crear Cuenta', function: () {}),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ya tienes una cuenta?',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Iniciar Sesion',
                                  style: TextStyle(fontSize: 18),
                                ))
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
