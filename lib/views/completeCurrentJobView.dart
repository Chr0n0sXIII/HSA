import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

class Completed_Current_Job_View extends StatefulWidget {
  const Completed_Current_Job_View({ Key? key }) : super(key: key);

  @override
  State<Completed_Current_Job_View> createState() => _Completed_Current_Job_ViewState();
}

class _Completed_Current_Job_ViewState extends State<Completed_Current_Job_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            PageTitle("Complete Current Job"),
            Footer(),
          ],
        )
      ),
    );
  }
}