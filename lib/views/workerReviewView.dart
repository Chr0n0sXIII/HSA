import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/responsive.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

class Worker_Review_View extends StatefulWidget {
  const Worker_Review_View({ Key? key }) : super(key: key);

  @override
  State<Worker_Review_View> createState() => _Worker_Review_ViewState();
}

class _Worker_Review_ViewState extends State<Worker_Review_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 299, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            PageTitle("Review This Worker"),
            Footer(),
          ],
        ),
      ),
    );
  }
}