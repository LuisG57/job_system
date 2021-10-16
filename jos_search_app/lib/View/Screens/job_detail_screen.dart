import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/navigation_bar/job_detail.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/job-details-screen';

  @override
  Widget build(BuildContext context) {
    return JobDetail();
  }
}
