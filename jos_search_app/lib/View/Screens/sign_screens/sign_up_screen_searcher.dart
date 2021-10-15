import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/form_widgets/sign_up_button.dart';
import 'package:jos_search_app/View/Widgets/form_widgets/sign_up_text_form_field.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background_white_board.dart';
import 'package:jos_search_app/providers/usuario.dart';

class SignUpScreenSearcher extends StatefulWidget {
  const SignUpScreenSearcher({Key? key}) : super(key: key);
  static const routeName = '/sign-up-searcher';

  @override
  State<SignUpScreenSearcher> createState() => _SignUpScreenSearcherState();
}

class _SignUpScreenSearcherState extends State<SignUpScreenSearcher> {
  var nuevoUsuario = Usuario(
      idUsuario: 0,
      nombre: '',
      apellido: '',
      idTipoUsuario: '',
      clave: '',
      correo: '',
      estatus: true,
      fechaCreacion: DateTime.now(),
      idCategoria: 0,
      descripcion: '',
      logo: '',
      url: '');

  var _initValues = {
    'idUsuario': DateTime.now().toString(),
    'nombre': '',
    'apellido': '',
    'idTipoUsuario': '',
    'clave': '',
    'correo': '',
    'estatus': '',
    'fechaCreacion': '',
    'idCategoria': '',
    'descripcion': '',
    'logo': '',
    'url': ''
  };

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
                                  Container(
                                    width: 300,
                                    child: TextFormField(
                                      decoration:
                                          InputDecoration(hintText: 'Nombre'),
                                      textInputAction: TextInputAction.done,
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
                                      decoration: InputDecoration(
                                          hintText: 'Contraseña'),
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
                                    child: DropdownButtonFormField<String>(
                                      items: [
                                        DropdownMenuItem<String>(
                                          child: Text('Programacion'),
                                          value: '1',
                                        ), //we need to figure out how to include more than one dropdown item
                                        DropdownMenuItem<String>(
                                          child: Text('Diseño'),
                                          value: '2',
                                        )
                                      ],
                                      onTap: () {},
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          hintText: 'Categoria'),
                                      // onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  width: 625,
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
