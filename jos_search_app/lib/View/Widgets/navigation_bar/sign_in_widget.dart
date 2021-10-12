import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/sign_in_screen.dart';
import 'package:jos_search_app/View/Screens/sign_up_screen.dart';
import 'package:jos_search_app/View/Widgets/navigation_bar/sign_up_desicion.dart';
import '../gradient_background/gradient_background_white_board.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWhiteBoard(Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/sign_in_icon.png'),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Introduzca su correo',
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Introduzca su contraseña',
                  labelText: 'Contraseña',
                ),
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('Olvidaste tu contraseña?')),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Text('Registrarme'))
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('dasdsa'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
