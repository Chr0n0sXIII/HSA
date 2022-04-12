import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/completedJobs_TilesWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class Complete_Job_List_View extends StatefulWidget {
  final User user;
  const Complete_Job_List_View({Key? key, required this.user}) : super(key: key);

  @override
  State<Complete_Job_List_View> createState() => _Complete_Job_List_ViewState();
}

class _Complete_Job_List_ViewState extends State<Complete_Job_List_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TopBar(user: widget.user,),
          PageTitle("View Your Completed Jobs"),
          Completed_Lising(),
          Footer(),
        ],
      )),
    );
  }
}
