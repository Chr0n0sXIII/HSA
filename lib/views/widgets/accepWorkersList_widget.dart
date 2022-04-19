import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_service_app/views/acceptWorkersView.dart';

import '../../dataClasses/User.dart';
import '../../dataClasses/jobData.dart';

class Active_Jobs_List extends StatefulWidget {
  final User user;
  const Active_Jobs_List({Key? key, required this.user}) : super(key: key);

  @override
  State<Active_Jobs_List> createState() => _Active_Jobs_ListState();
}

class _Active_Jobs_ListState extends State<Active_Jobs_List> {
  List<JobData> allJobs = [];
  bool imagesLoaded = false;
  int jobReq = 0;
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
                  itemBuilder: (context, index) =>
                      JobList(allJobs[index], widget.user))
              : Text(
                  'No New Job Requests',
                  style: TextStyle(fontSize: 40),
                )
        ],
      ),
    );
  }

  JobList(JobData job, User user) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      hoverColor: Color.fromRGBO(4, 31, 81, 0.25),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AcceptWorkerView(user: user, job: job)));
      },
      child: Container(
        margin: EdgeInsets.all(25),
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(7.0, 8.0))
            ]),
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
                    itemCount: job.ActiveJobImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final ImageURL = job.ActiveJobImages[index];
                      return buildWorkerImage(ImageURL, index);
                    },
                    options: CarouselOptions(
                      height: 125,
                      autoPlay: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                    )),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
              child: Text(
                job.jobName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
              child: Text(
                job.jobDescription,
                style: TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
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
              padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
              child: Text(
                '\$ ' + job.jobPrice,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
              child: Row(
                children: [
                  Text(
                    'Requests : ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (job.job_Requests.length).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> LoadData() async {
    await getJobs();
  }

  getJobs() async {
    List<String> ids = widget.user.activeJobs;
    var docJob;
    var snapshot;
    JobData job;
    List<JobData> jobs = [];
    docJob = await FirebaseFirestore.instance.collection('jobs').get();
    for (var doc in docJob.docs) {
      job = JobData.fromJson(doc.data());
      for (var id in ids) {
        List<String> check = job.job_Requests;
        if (check.length >= 1) {
          if (job.jobID == id) {
            jobs.add(job);
          }
          //print(snapshot.data()['isCompleted']);
        }
      }
    }
    setState(() {
      allJobs = jobs;
      total_Jobs = allJobs.length;
      imagesLoaded = true;
    });
  }

  Widget buildWorkerImage(String workerImageURL, int index) {
    return Container(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          workerImageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
