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
        Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              GradientTopBar(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(50),
                color: Colors.white,
                child: Column(
                  children: [
                    Text('asda'),
                    Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(
                          top: 8,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('LOGO '),
                        )),
                    Text('Nombre de la empresa'),
                    Divider(
                      color: Colors.blue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Position: Back-End Programmer'),
                            Text('Category: Development'),
                            Text('Schedule Type: Full Time'),
                            Text(
                                'Job Description: This is a back end developer job, in which we may need you to know c#.'),
                            Text('Website: WWW.CompanyWebsite.com')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Oct, 4th 2021'),
                            Text('Santo Domingo, DR'),
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
            ],
          ),
        ),
      ]),
    );
  }
}
