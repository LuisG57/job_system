import 'package:flutter/material.dart';
import 'package:jos_search_app/providers/login_provedor.dart';
import 'package:jos_search_app/providers/puesto.dart';
import 'package:provider/provider.dart';
// import 'dart:io' show Platform;

import '../Widgets/table_item.dart';
import '../Widgets/custom_divider.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/post_job_button.dart';
import '../Widgets/primary_button.dart';
import '../Widgets/gradient_background/gradient_background.dart';
import '../Widgets/gradient_background/gradient_top_bar.dart';
import '../Screens/lading_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);
  static const routeName = '/feed';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserAuthService>(context, listen: true);
    var user = provider.user;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final provedor = Provider.of<Puesto>(context, listen: false);
    return Stack(alignment: Alignment.center, children: [
      GradientBackGround(),
      Padding(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          child: Container(
            child: Scaffold(
              // backgroundColor: Colors.transparent,
              body: ListView(children: [
                Column(
                  children: [
                    GradientTopBar(),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SearchBar(),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                // PrimaryButton(
                                //   text: 'Search',
                                //   event: () {
                                //     Navigator.of(context)
                                //         .pushNamed(LandingScreen.routeName);
                                //   },
                                // ),
                                const Expanded(child: SizedBox()),
                                user.idTipoUsuario != 2
                                    ? PostJobButton()
                                    : Text(''),
                              ],
                            ),
                            const CustomDivider(
                              icon: Icon(Icons.design_services),
                              text: Text('Diseño'),
                            ),
                            const TableItem(
                                rowsperpage: 1, category: 'Diseñador'),
                            const CustomDivider(
                              icon: Icon(Icons.code),
                              text: Text('Programacion'),
                            ),
                            const TableItem(
                                rowsperpage: 4, category: 'Programador'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}
