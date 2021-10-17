import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_top_bar.dart';
import 'package:jos_search_app/providers/puesto.dart';
import 'package:provider/provider.dart';
import '../gradient_background/gradient_background_white_board.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final provedor = Provider.of<Puesto>(context, listen: true);
    var lista = provedor.getAllPosts();
    // print('directly ${provedor.getAllPosts().length}');
    // print('passed $lista');
    // print('id = $id');
    final post = lista.firstWhere((element) => element.idPuesto == id);
    print(post.fecha);
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        GradientBackGround(),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     GradientTopBar(),
        //   ],
        // ),
        Padding(
          padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
          child: Column(
            children: [
              GradientTopBar(
                option: true,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      // Text('Title'),
                      Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Image.network('${post.logo}'),
                              //     Text(
                              //   'LOGO ',
                              //   style: TextStyle(
                              //       fontSize: 28,
                              //       fontFamily: 'OpenSans',
                              //       fontWeight: FontWeight.w900,
                              //       color: Colors.black54),
                              // ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          '${post.compania}',
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w900,
                              color: Colors.black54),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Posición: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    Text(
                                      '${post.posicion}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Categoría: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      '${post.categoria}',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Tipo de jornada: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '${post.tipoJornada}',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 28.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 800,
                                      child: RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        'Descripción del empleo: ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                TextSpan(
                                                    text: '${post.descripcion}')
                                              ])),
                                    ),
                                    /*Text(
                                      'Descripción del empleo: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Container(
                                      width: 800,
                                      child: Text(
                                        'Este es un empleo como programador de back end, en el que debes de tener conocimientos en c#.',
                                        softWrap: true,
                                        // overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Sitio Web: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '${post.url}',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Correo: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${post.correoContacto}',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  '${post.fecha!.substring(0, 10)}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  '${post.ubicacion}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40.0),
                                child: Text(
                                  'Oferta de Activa!',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
