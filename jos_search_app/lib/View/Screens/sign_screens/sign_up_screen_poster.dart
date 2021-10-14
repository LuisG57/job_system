import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/form_widgets/sign_up_button.dart';
import 'package:jos_search_app/View/Widgets/form_widgets/sign_up_text_form_field.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background_white_board.dart';
import 'package:jos_search_app/providers/usuario.dart';
import 'package:jos_search_app/providers/usuario_provedor.dart';
import 'package:provider/provider.dart';

class SignUpScreenPoster extends StatefulWidget {
  const SignUpScreenPoster({Key? key}) : super(key: key);
  static const routeName = '/sign-up-poster';

  @override
  State<SignUpScreenPoster> createState() => _SignUpScreenPosterState();
}

class _SignUpScreenPosterState extends State<SignUpScreenPoster> {
  final formKey = GlobalKey<FormState>();
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
      descripcion: '1',
      logo: '',
      url: '');

  var _initValues = {
    // 'idUsuario': DateTime.now().toString(),
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
                          key: formKey,
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
                                      textInputAction: TextInputAction.next,
                                      onSaved: (valor) => nuevoUsuario =
                                          Usuario(
                                              idUsuario: 0,
                                              nombre: valor,
                                              apellido: nuevoUsuario.apellido,
                                              idTipoUsuario:
                                                  nuevoUsuario.idTipoUsuario,
                                              clave: nuevoUsuario.clave,
                                              correo: nuevoUsuario.correo,
                                              estatus: nuevoUsuario.estatus,
                                              fechaCreacion:
                                                  nuevoUsuario.fechaCreacion,
                                              idCategoria:
                                                  nuevoUsuario.idCategoria,
                                              descripcion:
                                                  nuevoUsuario.descripcion,
                                              logo: nuevoUsuario.logo,
                                              url: nuevoUsuario.url),
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
                                      textInputAction: TextInputAction.next,
                                      onSaved: (valor) => nuevoUsuario =
                                          Usuario(
                                              idUsuario: 0,
                                              nombre: nuevoUsuario.nombre,
                                              apellido: valor,
                                              idTipoUsuario:
                                                  nuevoUsuario.idTipoUsuario,
                                              clave: nuevoUsuario.clave,
                                              correo: nuevoUsuario.correo,
                                              estatus: nuevoUsuario.estatus,
                                              fechaCreacion:
                                                  nuevoUsuario.fechaCreacion,
                                              idCategoria:
                                                  nuevoUsuario.idCategoria,
                                              descripcion:
                                                  nuevoUsuario.descripcion,
                                              logo: nuevoUsuario.logo,
                                              url: nuevoUsuario.url),
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
                                      textInputAction: TextInputAction.next,
                                      onSaved: (valor) => nuevoUsuario =
                                          Usuario(
                                              idUsuario: 0,
                                              nombre: nuevoUsuario.nombre,
                                              apellido: nuevoUsuario.apellido,
                                              idTipoUsuario:
                                                  nuevoUsuario.idTipoUsuario,
                                              clave: nuevoUsuario.clave,
                                              correo: valor,
                                              estatus: nuevoUsuario.estatus,
                                              fechaCreacion:
                                                  nuevoUsuario.fechaCreacion,
                                              idCategoria:
                                                  nuevoUsuario.idCategoria,
                                              descripcion:
                                                  nuevoUsuario.descripcion,
                                              logo: nuevoUsuario.logo,
                                              url: nuevoUsuario.url),
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
                                      textInputAction: TextInputAction.next,
                                      onSaved: (valor) => nuevoUsuario =
                                          Usuario(
                                              idUsuario: 0,
                                              nombre: nuevoUsuario.nombre,
                                              apellido: nuevoUsuario.apellido,
                                              idTipoUsuario:
                                                  nuevoUsuario.idTipoUsuario,
                                              clave: valor,
                                              correo: nuevoUsuario.correo,
                                              estatus: nuevoUsuario.estatus,
                                              fechaCreacion:
                                                  nuevoUsuario.fechaCreacion,
                                              idCategoria:
                                                  nuevoUsuario.idCategoria,
                                              descripcion:
                                                  nuevoUsuario.descripcion,
                                              logo: nuevoUsuario.logo,
                                              url: nuevoUsuario.url),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   width: 350,
                                  //   child: TextFormField(
                                  //     decoration: InputDecoration(
                                  //         hintText: 'Numero de Teléfono'),
                                  //                               textInputAction: TextInputAction.next,
                                  //     onSaved: (valor) => nuevoUsuario =
                                  //         Usuario(
                                  //             idUsuario: null,
                                  //             nombre: nuevoUsuario.nombre,
                                  //             apellido: nuevoUsuario.apellido,
                                  //             idTipoUsuario: nuevoUsuario.idTipoUsuario,
                                  //             clave: nuevoUsuario.clave,
                                  //             correo: nuevoUsuario.correo,
                                  //             estatus: nuevoUsuario.estatus,
                                  //             fechaCreacion: nuevoUsuario.fechaCreacion,
                                  //             idCategoria: nuevoUsuario.idCategoria,
                                  //             descripcion: nuevoUsuario.descripcion,
                                  //             logo: nuevoUsuario.logo,
                                  //             url: nuevoUsuario.url),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    width: 250,
                                    child: DropdownButtonFormField<String>(
                                      items: [
                                        DropdownMenuItem<String>(
                                          onTap: () {},
                                          value: '1',
                                          child: Text('programacion'),
                                        ), //we need to figure out how to include more than one dropdown item
                                        DropdownMenuItem<String>(
                                          onTap: () {},
                                          child: Text('Diseño'),
                                          value: '2',
                                        )
                                      ],
                                      onChanged: (value) {},
                                      onTap: () {},
                                      decoration: InputDecoration(
                                          hintText: 'Categoria'),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300,
                                    child: TextFormField(
                                      decoration:
                                          InputDecoration(hintText: 'Web site'),
                                      textInputAction: TextInputAction.next,
                                      onSaved: (valor) => nuevoUsuario =
                                          Usuario(
                                              idUsuario: null,
                                              nombre: nuevoUsuario.nombre,
                                              apellido: nuevoUsuario.apellido,
                                              idTipoUsuario:
                                                  nuevoUsuario.idTipoUsuario,
                                              clave: nuevoUsuario.clave,
                                              correo: nuevoUsuario.correo,
                                              estatus: nuevoUsuario.estatus,
                                              fechaCreacion:
                                                  nuevoUsuario.fechaCreacion,
                                              idCategoria:
                                                  nuevoUsuario.idCategoria,
                                              descripcion:
                                                  nuevoUsuario.descripcion,
                                              logo: nuevoUsuario.logo,
                                              url: valor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    width: 300,
                                    child: TextFormField(
                                      decoration:
                                          InputDecoration(hintText: 'Logo Url'),
                                      textInputAction: TextInputAction.next,
                                      onSaved: (valor) => nuevoUsuario =
                                          Usuario(
                                              idUsuario: null,
                                              nombre: nuevoUsuario.nombre,
                                              apellido: nuevoUsuario.apellido,
                                              idTipoUsuario:
                                                  nuevoUsuario.idTipoUsuario,
                                              clave: nuevoUsuario.clave,
                                              correo: nuevoUsuario.correo,
                                              estatus: nuevoUsuario.estatus,
                                              fechaCreacion:
                                                  nuevoUsuario.fechaCreacion,
                                              idCategoria:
                                                  nuevoUsuario.idCategoria,
                                              descripcion:
                                                  nuevoUsuario.descripcion,
                                              logo: valor,
                                              url: nuevoUsuario.url),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SignUpButton(
                          buttonText: 'Crear Cuenta',
                          function: () {
                            formKey.currentState?.save();
                            final nuevousuario = Provider.of<UsuarioProvedor>(
                                context,
                                listen: false);
                            nuevousuario.createAccount(nuevoUsuario);
                            // print(nuevoUsuario.toString());
                          }),
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
                                onPressed: () {
                                  Provider.of<UsuarioProvedor>(context,
                                          listen: false)
                                      .createAccount(nuevoUsuario);
                                },
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
