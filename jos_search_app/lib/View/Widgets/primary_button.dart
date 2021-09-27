import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.text, required this.event, Key? key})
      : super(key: key);
  final String text;
  final Function event;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        event;
      },
      child: Text(text),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
      ),
    );
  }
}
