import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/dataClasses/jobDataUtil.dart';
import 'package:home_service_app/dataClasses/userData.dart';
import 'package:home_service_app/dataClasses/userDataUtil.dart';
import 'package:home_service_app/views/userProfileView.dart';

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
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          hoverColor: Color.fromRGBO(195, 166, 96, 0.25),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileView()));
          },
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 120,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(7.0, 8.0))
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                        'assets/profile_picture_place_holder.png',
                        scale: 0.65),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color.fromRGBO(195, 166, 96, 1),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Text(
                          widget.udata.uName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(7.0, 8.0),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //job
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      //Title
                      widget.jdata.jobName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      //Description
                      widget.jdata.jobDescription,
                      style: const TextStyle(
                          color: Color.fromRGBO(136, 134, 134, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 500,
            //price
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(7.0, 8.0),
                  ),
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.jdata.jobPrice,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 229, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: requestJob,
                    child: Text(
                      "Request Job",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(11, 206, 131, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Colors.white))),
                      fixedSize:
                          MaterialStateProperty.all<Size>(Size.fromHeight(50)),
                    ),
                  )
                ]),
          ),
        ),
      ]),
    );
    // TODO: implement build
  }

  requestJob() {}
}
