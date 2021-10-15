import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_top_bar.dart';
import '../gradient_background/gradient_background_white_board.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              GradientTopBar(),
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
                                child: Text(
                              'LOGO ',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54),
                            )),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Nombre de la empresa',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Posición: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Text(
                                    'Programador Back-End',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Categoría: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    'Programación',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              Text('Schedule Type: Full Time'),
                              Text(
                                  'Job Description: This is a back end developer job, in which we may need you to know c#.'),
                              Text('Website: WWW.CompanyWebsite.com')
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Oct, 4th 2021',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Santo Domingo, DR',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text('Active offer'),
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Aplicar'))
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
