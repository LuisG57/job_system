import 'package:flutter/material.dart';

class PageDetails extends StatelessWidget {
  const PageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Encuentra tu trabajo Ideal en Job Essentials',
            style: TextStyle(
                fontWeight: FontWeight.w800, height: 0.9, fontSize: 48),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Busca entre cientos de ofertas de trabajo que puedes filtrar en busca de tu trabajo ideal y lo mejor de todo es que puedes aplicar desde ya!',
            style: TextStyle(fontSize: 21, height: 1.7),
          )
        ],
      ),
    );
  }
}
