import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class workerList extends StatefulWidget {
  const workerList({Key? key}) : super(key: key);

  @override
  State<workerList> createState() => _workerListState();
}

class _workerListState extends State<workerList> {
  int total_workers = 7;
  String username = 'Placeholder Name';
  String userSkills = 'Placholder Skills';
  String userDesc = 'PlaceHolder Description';
  String userImage = 'https://picsum.photos/id/237/200/300';
  double userRating = 3;
  @override
  Widget build(BuildContext context) {
    return total_workers >= 1
    ?Container(
      width: 600,
      height: 650,
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: total_workers,
          itemBuilder: (context, index) {
            return workerTile(username, userSkills, userDesc,userRating,userImage);
          }),
    )
    : Text(
      'No Worker Request For Current Job',
      style: TextStyle(
        fontSize: 24
      ),
    );
  }

  Widget workerTile(String name, String skills, String description,
      double rating, String imageURL) {
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
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/profile_picture_place_holder.png',
                scale: 0.6,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: rating,
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
                    name,
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
                    skills,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                  child: Text(
                    description,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey, fontSize: 14,overflow: TextOverflow.ellipsis),
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
                        borderRadius: new BorderRadius.circular(30)
                      )
                    ),
                    onPressed: acceptThisWorker, 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(244, 67, 54, 1),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)
                      )
                    ),
                    onPressed: rejectThisWorker, 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Reject',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void acceptThisWorker() {
  }

  void rejectThisWorker() {
  }
}
