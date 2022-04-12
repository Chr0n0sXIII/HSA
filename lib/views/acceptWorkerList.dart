import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/accepWorkersList_widget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class Active_Job_List_View extends StatefulWidget {
  final User user;
  const Active_Job_List_View({Key? key, required this.user}) : super(key: key);

  @override
  State<Active_Job_List_View> createState() => _Active_Job_List_ViewState();
}

class _Active_Job_List_ViewState extends State<Active_Job_List_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TopBar(user: widget.user,),
          PageTitle("Active Jobs"),
          Active_Jobs_List(user: widget.user,),
          Footer(),
        ],
      )),
    );
  }
}
