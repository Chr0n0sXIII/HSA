import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_service_app/views/acceptWorkersView.dart';

import '../../dataClasses/User.dart';

class Active_Jobs_List extends StatefulWidget {
  final User user;
  const Active_Jobs_List({Key? key, required this.user}) : super(key: key);

  @override
  State<Active_Jobs_List> createState() => _Active_Jobs_ListState();
}

class _Active_Jobs_ListState extends State<Active_Jobs_List> {
  List<String> workerImageURL_list = <String>[];
  String j_title = 'Placeholder Title';
  String j_description = 'Placeholder Description';
  String j_location = 'Placeholder Location';
  String j_price = 'Placeholer Price';
  bool recievedImages = false;
  int jobReq = 0;
  int total_Jobs = 0;
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
                  itemBuilder: (context, index) => JobList(
                      j_title,
                      j_description,
                      j_location,
                      j_price,
                      recievedImages,
                      workerImageURL_list,
                      jobReq,widget.user))
              : Text(
                  'No Active Jobs',
                  style: TextStyle(fontSize: 40),
                )
        ],
      ),
    );
  }

  JobList(
      String jobTile,
      String job_description,
      String job_Location,
      String job_Price,
      bool imagesLoaded,
      List<String> ImageURL_list,
      int jobRequest, User user) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      hoverColor: Color.fromRGBO(4, 31, 81, 0.25),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AcceptWorkerView(
                      user: user,
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
                    itemCount: ImageURL_list.length,
                    itemBuilder: (context, index, realIndex) {
                      final ImageURL = ImageURL_list[index];
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
                jobTile,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Text(
                job_description,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Row(
                children: [
                  Text(
                    job_Location,
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
              child: Text(
                job_Price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Row(
                children: [
                  Text(
                    'Requests : ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   Text(
                     jobRequest.toString(),
                     style: TextStyle(
                       fontWeight: FontWeight.bold
                     ),
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
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          workerImageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
