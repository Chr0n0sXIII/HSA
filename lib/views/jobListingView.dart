import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/jobData.dart';
import 'package:home_service_app/views/widgets/jobDataUtil.dart';
import 'package:home_service_app/views/widgets/jobListing_Card.dart';
import 'package:home_service_app/views/widgets/jobListing_MapWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';

class jobListingView extends StatelessWidget {
  List<JobData> jobdata = JobDataUtil.TestData_JobsData();

  jobListingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Text("Map PlaceHolder"),
                        ],
                      )),
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: jobdata.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return JobListingCard(
                            jobData: jobdata[index],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

// ignore: camel_case_types
class jobSelection {
  JobData? Job;
}
