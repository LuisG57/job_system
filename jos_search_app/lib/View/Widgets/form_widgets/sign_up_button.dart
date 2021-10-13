import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  SignUpButton(
      {this.borderRadius = 30.0,
      this.veriticalPadding = 16.0,
      this.horizontalPadding = 0,
      this.height = 50,
      this.width = 200,
      required this.buttonText,
      required this.function,
      Key? key})
      : super(key: key);

  double borderRadius;
  double veriticalPadding;
  double horizontalPadding;
  double width;
  double height;
  final String buttonText;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: veriticalPadding, horizontal: horizontalPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ElevatedButton(
          onPressed: () =>
              function(), //Check if we have no issues later with this approach for the pointer
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 16),
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(width, height)),
          ),
        ),
      ),
    );
  }
}
