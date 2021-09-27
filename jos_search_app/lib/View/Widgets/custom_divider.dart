import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({required this.icon, required this.text, Key? key})
      : super(key: key);
  // CustomDivider({required this.icon, required this.text});
  final Icon icon;
  final Text text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            child: Divider(
              color: Colors.black54,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Container(
              child: Row(
                children: [
                  icon,
                  text,
                ],
              ),
            ),
          ),
          const Expanded(
              child: Divider(
            color: Colors.black54,
            thickness: 1,
          )),
        ],
      ),
    );
  }
}
