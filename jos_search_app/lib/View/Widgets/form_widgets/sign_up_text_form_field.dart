import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  SignUpTextFormField({required this.hintText, required this.Width, Key? key})
      : super(key: key);
  final String hintText;
  final double Width;
  TextFormField textinput = TextFormField();

  @override
  Widget build(BuildContext context) {
    textinput = TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
    return Container(
      width: Width,
      child: textinput,
    );
  }
}
