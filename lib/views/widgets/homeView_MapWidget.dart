import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps/google_maps.dart' as gm;
import 'package:home_service_app/dataClasses/jobData.dart';
import 'dart:html';
import 'dart:ui' as ui;

import 'package:home_service_app/views/completeCurrentJobView.dart';
import 'package:home_service_app/views/homeView.dart';
import 'package:home_service_app/views/jobListingView.dart';

import '../../dataClasses/User.dart';

class MapView extends StatefulWidget {
  final User user;
  const MapView({Key? key, required this.user}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late JobData job;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkJob();
  }

  bool active_Job = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 580,
          width: 450,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(7.0, 8.0))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 25, 5, 0),
                    child: active_Job == false
                        ? Text(
                            'No Current Job Taken',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  job.jobName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                job.jobDescription,
                                maxLines: 1,
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                              )
                            ],
                          )),
              ),
              Expanded(
                  flex: 1,
                  child: active_Job == false
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => jobListingView(
                                          user: widget.user,
                                        )));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(196, 196, 196, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'Looking For A Job',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Icon(
                                    Icons.search_outlined,
                                    color: Colors.grey,
                                    size: 36,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45))),
                          child: GoogleMap(),
                        )),
            ],
          ),
        ),
        active_Job == true
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(11, 206, 131, 1),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Completed_Current_Job_View(
                                        user: widget.user,
                                        job: job,
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Complete Job',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(244, 67, 54, 1),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30))),
                        onPressed: () {
                          cancelJob();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Cancel Job',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              )
            : Container()
      ],
    );
  }

  Future<void> LoadJob() async {
    await getJob();
  }

  getJob() async {
    var docJob;
    var snapshot;
    docJob = FirebaseFirestore.instance
        .collection('jobs')
        .doc(widget.user.currentJobTaken);
    snapshot = await docJob.get();
    setState(() {
      job = JobData.fromJson(snapshot.data());
      active_Job = true;
    });
  }

  GoogleMap() {
    String htmlId = widget.user.user_ID + job.jobID;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = gm.LatLng(job.Latitude, job.Longitude);

      final mapOptions = gm.MapOptions()
        ..zoom = 13
        ..center = gm.LatLng(job.Latitude, job.Longitude);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none'
        ..style.borderRadius = '30px';

      final map = gm.GMap(elem, mapOptions);

      gm.Marker(gm.MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Active Job Location');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  Future cancelJob() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30)),
              title: Text(
                'Are Your Sure About Cancelling This Job ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(11, 206, 131, 1),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30))),
                      onPressed: () {
                        removeActiveJob();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(244, 67, 54, 1),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'No',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ));
  }

  removeActiveJob() {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(widget.user.user_ID);
    widget.user.setactiveJob("");
    docUser.update({'Current_Job_Taken': widget.user.currentJobTaken});
    showToast('Job Removed From Profile');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeView(
                  user: widget.user,
                )));
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, webPosition: 'center', timeInSecForIosWeb: 4);
  }

  Future<void> checkJob() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(widget.user.user_ID);
    final snapshot = await docUser.get();
    widget.user.setactiveJob(snapshot.data()!['Current_Job_Taken']);
     if (widget.user.currentJobTaken != "") {
      LoadJob();
    }
  }
}
