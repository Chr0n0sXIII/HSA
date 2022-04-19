// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_JobDesc.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_ScrollWidget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class AcceptWorkerView extends StatefulWidget {
  final User user;
  final JobData job;
  const AcceptWorkerView({Key? key, required this.user, required this.job}) : super(key: key);

  @override
  State<AcceptWorkerView> createState() => _AcceptWorkerViewState();
}

class _AcceptWorkerViewState extends State<AcceptWorkerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(user: widget.user),
            PageTitle('Request From Workers'),
            Padding(
              padding: const EdgeInsets.fromLTRB(250, 8, 250, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  accpectWorkerJobDescription(job: widget.job,),
                  workerList(job: widget.job,currentUser: widget.user,)
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
