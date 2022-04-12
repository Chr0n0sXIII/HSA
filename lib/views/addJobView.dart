import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/addJob_FormWidget.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class Add_New_Job_View extends StatefulWidget {
  final User user;
  const Add_New_Job_View({Key? key, required this.user}) : super(key: key);

  @override
  State<Add_New_Job_View> createState() => _Add_New_Job_ViewState();
}

class _Add_New_Job_ViewState extends State<Add_New_Job_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(user: widget.user,),
            PageTitle("Add a New Job For Listing"),
            Add_Job_Form(user: widget.user,),
            Footer(),
          ],
        ),
      ),
    );
  }
}
