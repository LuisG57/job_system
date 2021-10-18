import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/feed_screen.dart';
import 'package:jos_search_app/View/Screens/sign_in_screen.dart';
import 'package:jos_search_app/View/Screens/sign_up_screen.dart';
import 'package:jos_search_app/View/Widgets/navigation_bar/sign_up_desicion.dart';
import 'package:jos_search_app/providers/login_provedor.dart';
import 'package:provider/provider.dart';
import '../gradient_background/gradient_background_white_board.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final formKey = GlobalKey<FormState>();
  String? correo;
  String? clave;

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 175, child: Image.asset('images/sign_in_icon.png')),
                TextFormField(
                  onSaved: (valor) => correo = valor,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Introduzca su correo',
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  onSaved: (valor) => clave = valor,
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Introduzca su contraseña',
                    labelText: 'Contraseña',
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Olvidaste tu contraseña?',
                          style: TextStyle(fontSize: 16),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text(
                          'Registrarme',
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        UserAuthService provedor = Provider.of<UserAuthService>(
                            context,
                            listen: false);
                        formKey.currentState?.save();
                        await provedor
                            .userAuth(correo, clave)
                            .then((value) async {
                          if (value) {
                            Navigator.pushReplacementNamed(
                                context, FeedScreen.routeName);
                          } else {
                            print('you inputted an incorrect value');
                            await showDialog<Null>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Usuario o clave incorrectos!'),
                                content: Text(
                                    'El usuario o la clave estan incorrectos!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Aceptar'),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.greenAccent.shade400)),
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
