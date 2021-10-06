import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

// import '../Widgets/table_item.dart';
// import '../Widgets/custom_divider.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/post_job_button.dart';
import '../Widgets/primary_button.dart';
import '../Widgets/navigation_bar/navigation_bar.dart';

class JobDetailsScreen extends StatelessWidget {
  static const routeName = '/post-details';
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(body: NavigationBar());
  }
}
// SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: width * 0.04,
//               vertical: height * 0.02,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   //extract widget later...
//                   children: [
//                     SearchBar(),
//                     SizedBox(
//                       width: width * 0.01,
//                     ),
//                     PrimaryButton(
//                       text: 'Search',
//                       event: () {},
//                     ),
//                     const Expanded(child: SizedBox()),
//                     PostJobButton(),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(20.0),
//                       child: Container(
//                         width: 275,
//                         height: 225,
//                         // decoration: BoxDecoration(
//                         //   border: Border.all(width: 2, color: Colors.blue),
//                         // ),
//                         child: Image.network(
//                           'data:image/jpeg;base64,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',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Title',
//                                 style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: 'OpenSans'),
//                               ),
//                               Text(
//                                 'Country, City',
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.w500),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10.0),
//                                 child: Divider(),
//                               ),
//                               Text(
//                                 'Job title - Schedule type',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10.0),
//                                 child: Divider(),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text('Job Description...'),
//                 Text(
//                   'How to apply? \nSend your resume to [Email] at [Web site]',
//                   style: TextStyle(
//                     fontFamily: 'Quicksand',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),