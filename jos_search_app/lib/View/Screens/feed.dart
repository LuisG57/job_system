import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

import '../Widgets/table_item.dart';
import '../Widgets/custom_divider.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/post_job_button.dart';
import '../Widgets/primary_button.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SearchBar(),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    PrimaryButton(
                      text: 'Search',
                      event: () {},
                    ),
                    const Expanded(child: SizedBox()),
                    PostJobButton(),
                  ],
                ),
                const CustomDivider(
                  icon: Icon(Icons.design_services),
                  text: Text('Design'),
                ),
                const TableItem(rowsperpage: 1),
                const CustomDivider(
                  icon: Icon(Icons.code),
                  text: Text('Programming'),
                ),
                const TableItem(rowsperpage: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
