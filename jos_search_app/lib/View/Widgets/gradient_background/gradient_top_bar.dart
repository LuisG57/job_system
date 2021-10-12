import 'package:flutter/material.dart';

class GradientTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(175, 238, 238, 1),
            Color.fromRGBO(0, 206, 209, 1)
          ])),
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('images/about_us_icon.png'),
          ),
          Row(
            children: [
              CircleAvatar(),
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 20, right: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Frankelly Guzman'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Log out'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 26),
                child: Text('Poster'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
