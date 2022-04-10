import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Completed_Lising extends StatefulWidget {
  const Completed_Lising({Key? key}) : super(key: key);

  @override
  State<Completed_Lising> createState() => _Completed_LisingState();
}

class _Completed_LisingState extends State<Completed_Lising> {
  List<String> workerImageURL_list = <String>[];
  String j_title = 'Placeholder Title';
  String j_description =
      'Placeholder DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription';
  String j_location = 'Placeholder Location';
  String j_price = 'Placeholer Price';
  bool recievedImages = false;
  bool reviewed = false;
  int total_Jobs = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 8, 250, 8),
      child: Column(
        children: [
          total_Jobs >= 1
          ?GridView.builder(
              shrinkWrap: true,
              itemCount: total_Jobs,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) => completed_Review(
                  j_title,
                  j_description,
                  j_location,
                  j_price,
                  recievedImages,
                  workerImageURL_list,
                  reviewed))
          :Text(
            'No Completed Jobs',
            style: TextStyle(
              fontSize: 40
            ),
          )
        ],
      ),
    );
  }

  completed_Review(String jobTile, String job_description, String job_Location,
      String job_Price, bool imagesLoaded, List<String> ImageURL_list, reviewedByClient) {
    return Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job_Price,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                reviewedByClient == false
                ?Icon(
                  Icons.check_box_outline_blank,
                  color : Colors.red,
                )
                :Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
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
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          workerImageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
