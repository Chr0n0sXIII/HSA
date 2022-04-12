import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/responsive.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';
import 'package:home_service_app/views/widgets/workerReview_FormWidget.dart';

import '../dataClasses/User.dart';

class Worker_Review_View extends StatefulWidget {
  final User user;
  const Worker_Review_View({Key? key, required this.user}) : super(key: key);

  @override
  State<Worker_Review_View> createState() => _Worker_Review_ViewState();
}

class _Worker_Review_ViewState extends State<Worker_Review_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(user: widget.user,),
            PageTitle("Review This Worker"),
            Worker_Review_Fo(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
