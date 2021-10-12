import 'package:flutter/material.dart';
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
              Text("Que desearia realizar"),
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
          ),
        ),
      ),
    ));
  }
}
