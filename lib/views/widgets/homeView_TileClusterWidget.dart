import 'dart:async';
import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_service_app/dataClasses/User.dart';
import 'package:home_service_app/views/userProfileView.dart';

class TileCluster extends StatefulWidget {
  const TileCluster({Key? key}) : super(key: key);

  @override
  State<TileCluster> createState() => _TileClusterState();
}

class _TileClusterState extends State<TileCluster> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserTile(),
          EditJobTile(),
          AcceptWorksTile(),
          Row(
            children: [CompleteJobTile(), AddNewJobTile()],
          )
        ],
      ),
    );
  }
}

class UserTile extends StatefulWidget {
  const UserTile({Key? key}) : super(key: key);

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  double rating = 1;
  String user_Skils = 'User Trade Skills and Profession';
  String user_desc = 'User Description about me';
  String pfp = "";
  var imageurl = "";
  var isEmpty = false;

  @override
  Widget build(BuildContext context) {
    waitbox();
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      hoverColor: Color.fromRGBO(195, 166, 96, 0.25),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserProfileView()));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          height: 120,
          width: 450,
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
              isEmpty == false
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'assets/profile_picture_place_holder.png',
                        scale: 0.6,
                      ),
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new NetworkImage(imageurl))),
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBarIndicator(
                    rating: rating.toDouble(),
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color.fromRGBO(195, 166, 96, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      user_Skils,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      user_desc,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  waitbox() async {
    await getRating();
  }

  getRating() async {
    //Get String from DB
    final value = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: User.email)
        .get();
    for (var doc in value.docs) {
      setState(() {
        rating = doc.get('workerRating');
        user_Skils = doc.get('skills');
        user_desc = doc.get('about');
        pfp = doc.get('pfp');
        print(pfp);
      });
      //Use PFP name too get from FireStorage
      Reference ref = FirebaseStorage.instance.ref().child(pfp);
// no need of the file extension, the name will do fine.
      var url = await ref.getDownloadURL();
      setState(() {
        imageurl = url;
      });
      print(url);
      isEmpty = true;
      return;
    }
  }
}

class EditJobTile extends StatelessWidget {
  const EditJobTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 140,
        width: 450,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.border_color_outlined,
              color: Color.fromRGBO(195, 166, 96, 1),
              size: 100,
            ),
            Text(
              'View Your Job Listings \nand Edit',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AcceptWorksTile extends StatelessWidget {
  const AcceptWorksTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 140,
        width: 450,
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
            Expanded(
              flex: 1,
              child: Icon(
                Icons.person_add,
                color: Color.fromRGBO(195, 166, 96, 1),
                size: 100,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'Accept Workers',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CompleteJobTile extends StatelessWidget {
  const CompleteJobTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 150,
        width: 215,
        decoration: BoxDecoration(
            color: Color.fromRGBO(5, 190, 231, 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(7.0, 8.0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Completed',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.check_box,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'Jobs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddNewJobTile extends StatelessWidget {
  const AddNewJobTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 150,
        width: 215,
        decoration: BoxDecoration(
            color: Color.fromRGBO(7, 223, 81, 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(7.0, 8.0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_box_rounded,
              color: Colors.white,
              size: 50,
            ),
            Text(
              'Add  a  New\n Job Listing',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
