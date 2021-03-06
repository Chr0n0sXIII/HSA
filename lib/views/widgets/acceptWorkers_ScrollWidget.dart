import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/views/homeView.dart';

import '../../dataClasses/User.dart';

class workerList extends StatefulWidget {
  final JobData job;
  final User currentUser;
  const workerList({Key? key, required this.job, required this.currentUser}) : super(key: key);

  @override
  State<workerList> createState() => _workerListState();
}

class _workerListState extends State<workerList> {
  List<User> allUsers = [];
  int total_workers = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return total_workers > 0
        ? Container(
            width: 600,
            height: 650,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: total_workers,
                itemBuilder: (context, index) {
                  return workerTile(allUsers[index]);
                }),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(50, 8, 50, 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
    // : Text(
    //     'No Worker Request For Current Job',
    //     style: TextStyle(fontSize: 24),
    // );
  }

  Widget workerTile(User user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 8, 50, 20),
      child: Container(
        height: 150,
        width: 350,
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
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    // ignore: unnecessary_new
                    image: new DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(user.pfp))),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: user.userRating,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color.fromRGBO(195, 166, 96, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                  child: Text(
                    user.uName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                  child: Text(
                    user.skills,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                  child: Text(
                    user.about,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(11, 206, 131, 1),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30))),
                      onPressed: () {
                        acceptThisWorker(user);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Accept',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(244, 67, 54, 1),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30))),
                      onPressed: rejectThisWorker,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Reject',
                          style: TextStyle(fontSize: 18),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void acceptThisWorker(User user) {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.user_ID);
    user.setactiveJob(widget.job.jobID);
    docUser.update({'Current_Job_Taken': user.currentJobTaken});
    widget.job.clearRequest();
    final docJob =
        FirebaseFirestore.instance.collection('jobs').doc(widget.job.jobID);
    docJob.update({'Job_Requests': widget.job.job_Requests});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeView(
                  user: widget.currentUser,
                )));
  }

  void rejectThisWorker() {}

  Future<void> LoadData() async {
    await getUsers();
  }

  getUsers() async {
    List<String> ids = widget.job.job_Requests;
    var docUser;
    var snapshot;
    User user;
    List<User> users = [];
    for (int i = 0; i < ids.length; i++) {
      docUser = FirebaseFirestore.instance.collection('users').doc(ids[i]);
      snapshot = await docUser.get();
      user = User.fromJson(snapshot.data());
      users.add(user);
    }
    setState(() {
      allUsers = users;
      total_workers = allUsers.length;
    });
  }
}
