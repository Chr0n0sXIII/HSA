import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/dataClasses/jobDataUtil.dart';
import 'package:home_service_app/dataClasses/userData.dart';
import 'package:home_service_app/dataClasses/userDataUtil.dart';

class jobDetails_InfoWidget extends StatefulWidget {
  userData udata = UserDataUtil.TestData_UserData()[1];
  JobData jdata = JobDataUtil.TestData_JobsData()[1];
  @override
  jobDetails_InfoWidget_State createState() => jobDetails_InfoWidget_State();
}

class jobDetails_InfoWidget_State extends State<jobDetails_InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, 10),
                    blurRadius: 5.0,
                    spreadRadius: 0)
              ]),
          child: Expanded(
            flex: 1,
            child: Column(
              //job
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //Title
                  widget.jdata.jobName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  //Description
                  widget.jdata.jobDescription,
                  style: const TextStyle(
                      color: Color.fromRGBO(136, 134, 134, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        )
      ]),
    );
    // TODO: implement build
  }
}
