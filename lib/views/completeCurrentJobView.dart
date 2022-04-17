import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/views/widgets/completeCurrentJob_ReviewForm.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class Completed_Current_Job_View extends StatefulWidget {
  final User user;
  final JobData job;
  const Completed_Current_Job_View({Key? key, required this.user, required this.job})
      : super(key: key);

  @override
  State<Completed_Current_Job_View> createState() =>
      _Completed_Current_Job_ViewState();
}

class _Completed_Current_Job_ViewState
    extends State<Completed_Current_Job_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TopBar(
            user: widget.user,
          ),
          PageTitle("Complete Current Job"),
          Complete_Job_Form(user: widget.user, job: widget.job,),
          Footer(),
        ],
      )),
    );
  }
}
