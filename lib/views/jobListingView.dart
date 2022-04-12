import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/User.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/dataClasses/jobDataUtil.dart';
import 'package:home_service_app/views/widgets/jobListing_Card.dart';
import 'package:home_service_app/views/widgets/jobListing_MapWidget.dart';
import 'package:home_service_app/views/widgets/jobListing_SearchWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';

class jobListingView extends StatelessWidget {
  List<JobData> jobdata = [];
  List<Image> images = [];
  final User user;

  jobListingView({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          TopBar(user: user,),
          jobListing_SearchWidget(),
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
                  jobdata.isNotEmpty
                
                  ?Expanded(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: jobdata.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return JobListingCard(
                            jobData: jobdata[index],
                            image: images[index],
                          );
                        }),
                  ):Text("Empty")
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

/*  loadJobs() async {
    final value = await FirebaseFirestore.instance
        .collection("jobs")
        .get();
    for (var doc in value.docs) {
      String val = doc.get('Password');
      //print(val.toString());
      // print(passController.text);
      print((passController.text.compareTo(val.toString())));
      if (passController.text.compareTo(val.toString()) == 0) {
        setState(() {
          validated = true;
        });
        break;
      } else {
        setState(() {
          validated = false;
        });
      }
    }
  }*/

  initjobs() {
    for (JobData j in JobDataUtil.TestData_JobsData()) {
      FirebaseFirestore.instance.collection('openjobs').add(j.toMap());
    }
  }
}
