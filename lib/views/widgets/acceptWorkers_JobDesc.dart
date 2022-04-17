import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_service_app/dataClasses/jobData.dart';

class accpectWorkerJobDescription extends StatefulWidget {
  final JobData job;
  const accpectWorkerJobDescription({Key? key, required this.job}) : super(key: key);

  @override
  State<accpectWorkerJobDescription> createState() =>
      _accpectWorkerJobDescriptionState();
}

class _accpectWorkerJobDescriptionState
    extends State<accpectWorkerJobDescription> {
  List<String> ImageURL_list = <String>[];
  String j_title = 'Placeholder Title';
  String j_description = 'Placeholder Description';
  String j_location = 'Placeholder Location';
  String j_price = 'Placeholer Price';
  bool imageLoaded = false;
  int total_Jobs = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageLoaded == false
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
                    return buildImage(ImageURL, index);
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
              j_title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              j_description,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Row(
              children: [
                Text(
                  j_location,
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
              j_price,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String imageURL, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
