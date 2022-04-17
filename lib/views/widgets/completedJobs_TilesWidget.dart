import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_service_app/views/views.dart';

import '../../dataClasses/User.dart';
import '../../dataClasses/jobData.dart';

class Completed_Lising extends StatefulWidget {
  final User user;
  const Completed_Lising({Key? key, required this.user}) : super(key: key);

  @override
  State<Completed_Lising> createState() => _Completed_LisingState();
}

class _Completed_LisingState extends State<Completed_Lising> {
  List<String> workerImageURL_list = <String>[];
  List<JobData> allJobs = [];
  bool recievedImages = false;
  bool reviewed = false;
  int total_Jobs = 0;
  bool imagesLoaded = false;

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
                  itemBuilder: (context, index) =>
                      completed_Review(allJobs[index]))
              : Text(
                  'No Completed Jobs',
                  style: TextStyle(fontSize: 40),
                )
        ],
      ),
    );
  }

  getJobs() async {
    List<String> ids = widget.user.completedJobs;
    var docJob;
    var snapshot;
    JobData job;
    List<JobData> jobs = [];
    for (int i = 1; i < ids.length; i++) {
      docJob = FirebaseFirestore.instance.collection('jobs').doc(ids[i]);
      snapshot = await docJob.get();
      job = JobData.fromJson(snapshot.data());
      jobs.add(job);
      print(snapshot.data()['isCompleted']);
    }
    setState(() {
      allJobs = jobs;
      total_Jobs = allJobs.length;
      recievedImages = true;
      imagesLoaded = true;
    });
  }

  completed_Review(JobData job) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      hoverColor: Color.fromRGBO(4, 31, 81, 0.25),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Worker_Review_View(
                      user: widget.user,
                      job: job,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(25),
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagesLoaded == false
                ? Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(196, 196, 196, 1)),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : CarouselSlider.builder(
                    itemCount: job.CompletedJobImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final ImageURL = job.CompletedJobImages[index];
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
                    job.jobPrice,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  job.isReviewed == false
                      ? Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.check_box,
                          color: Colors.green,
                        )
                ],
              ),
            )
          ],
        ),
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

  Future<void> LoadData() async {
    await getJobs();
  }
}
