import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/views/jobDetailsView.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as gm;

import '../dataClasses/User.dart';

class jobListingView extends StatefulWidget {
  final User user;
  const jobListingView({Key? key, required this.user}) : super(key: key);

  @override
  State<jobListingView> createState() => _jobListingViewState();
}

class _jobListingViewState extends State<jobListingView> {
  List<JobData> allJobs = [];
  List<String> job_Types = [
    'Yark Work',
    'Cleaning',
    'Landscaping',
    'Painting',
    'Maintainace',
    'Plumbing',
    'Misc'
  ];
  List<String> job_Distance = ['Closest', 'Farthest'];
  List<String> job_Prices = ['Low - High', 'High - Low'];
  String? selected_Type = 'Plumbing';
  String? selected_Distance = 'Closest';
  String? selected_Price = 'Low - High';
  int total_jobs = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(user: widget.user),
            PageTitle('Job Listings'),
            searchBar(),
            Row(
              children: [jobListingMapView(), jobList()],
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  searchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 250, right: 250),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search Job...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton<String>(
                        focusColor: Colors.transparent,
                        value: selected_Type,
                        items: job_Types
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(item),
                                )))
                            .toList(),
                        onChanged: (item) => setState(() {
                              selected_Type = item;
                            })),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton<String>(
                        focusColor: Colors.transparent,
                        value: selected_Distance,
                        items: job_Distance
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(item),
                                )))
                            .toList(),
                        onChanged: (item) => setState(() {
                              selected_Distance = item;
                            })),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton<String>(
                        focusColor: Colors.transparent,
                        value: selected_Price,
                        items: job_Prices
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(item),
                                )))
                            .toList(),
                        onChanged: (item) => setState(() {
                              selected_Price = item;
                            })),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  jobListingMapView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 10, 50, 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(15)),
        height: 600,
        width: 600,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: googleMaps(),
              ),
            )
          ],
        ),
      ),
    );
  }

  jobList() {
    getJobs();
    return Container(
      height: 600,
      width: 600,
      child: total_jobs >= 0
      ?ListView.builder(
          shrinkWrap: true,
          itemCount: total_jobs,
          itemBuilder: (context, index) {
            return jobTile(allJobs[index]);
          })
      :Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  googleMaps() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = gm.LatLng(10.640821, -61.398547);

      final mapOptions = gm.MapOptions()
        ..zoom = 13
        ..center = gm.LatLng(10.640821, -61.398547);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none'
        ..style.borderRadius = '13px';

      final map = gm.GMap(elem, mapOptions);
      gm.Marker(gm.MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Active Job Location');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  Widget jobTile(JobData job) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        hoverColor: Color.fromRGBO(195, 166, 96, 0.25),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => jobDetailsView(
                user: widget.user, job: job,
              )
            )
          );
        },
        child: Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    job.ActiveJobImages[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.jobName,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      job.jobDescription,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          job.jobLocation,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.pin_drop,
                          color: Colors.red,
                        )
                      ],
                    ),
                    Text(
                      '\$ ' + job.jobPrice,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getJobs() async {
    List<String> ids = widget.user.activeJobs;
    var docJob;
    var snapshot;
    JobData job;
    List<JobData> jobs = [];
    for (int i = 1; i < ids.length; i++) {
      docJob = FirebaseFirestore.instance.collection('jobs').doc(ids[i]);
      snapshot = await docJob.get();
      job = JobData.fromJson(snapshot.data());
      jobs.add(job);
    }
    setState(() {
      total_jobs = allJobs.length;
      allJobs = jobs;
    });
  }
}
