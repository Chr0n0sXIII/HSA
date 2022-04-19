import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_service_app/dataClasses/jobData.dart';

import '../../dataClasses/User.dart';

class editJobTileListing extends StatefulWidget {
  final User user;
  const editJobTileListing({Key? key, required this.user}) : super(key: key);

  @override
  State<editJobTileListing> createState() => _editJobTileListingState();
}

class _editJobTileListingState extends State<editJobTileListing> {
  List<JobData> allJobs = [];
  bool recievedImages = false;
  int total_Jobs = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 8, 250, 8),
      child: Column(
        children: [
          total_Jobs >= 1
              ? GridView.builder(
                  shrinkWrap: true,
                  itemCount: total_Jobs,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => edit_Tile(allJobs[index]))
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
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
      if (snapshot.data()['isCompleted'] == false) {
        job = JobData.fromJson(snapshot.data());
        jobs.add(job);
        print(snapshot.data()['isCompleted']);
      }
    }
    setState(() {
      allJobs = jobs;
      total_Jobs = allJobs.length;
      recievedImages = true;
    });
  }

  edit_Tile(JobData job) {
    return Container(
      margin: EdgeInsets.all(25),
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white,
          boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(7.0, 8.0))
            ]
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          recievedImages == false
              ? Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(196, 196, 196, 1)),
                  child: Center(child: CircularProgressIndicator()),
                )
              : CarouselSlider.builder(
                  itemCount: job.ActiveJobImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final ImageURL = job.ActiveJobImages[index];
                    return buildWorkerImage(ImageURL, index);
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                  )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              job.jobName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              job.jobDescription,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Row(
              children: [
                Text(
                  job.jobLocation,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ' + job.jobPrice,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: Color.fromRGBO(54, 153, 244, 1),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30))),
                    onPressed: editThisJob,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: Color.fromRGBO(244, 67, 54, 1),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30))),
                    onPressed: removeThisJob,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: Text(
                        'Remove',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildWorkerImage(String workerImageURL, int index) {
    return Container(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          workerImageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  editThisJob() {}

  removeThisJob() {}

  Future<void> LoadData() async {
    await getJobs();
  }
}
