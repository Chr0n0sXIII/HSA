import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_service_app/dataClasses/jobData.dart';

class accpectWorkerJobDescription extends StatefulWidget {
  final JobData job;
  const accpectWorkerJobDescription({Key? key, required this.job})
      : super(key: key);

  @override
  State<accpectWorkerJobDescription> createState() =>
      _accpectWorkerJobDescriptionState();
}

class _accpectWorkerJobDescriptionState
    extends State<accpectWorkerJobDescription> {
  bool imageLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.job.ActiveJobImages.length > 0) {
      imageLoaded = true;
    }
  }

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
                  itemCount: widget.job.ActiveJobImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final ImageURL = widget.job.ActiveJobImages[index];
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
              widget.job.jobName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              widget.job.jobDescription,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Row(
              children: [
                Text(
                  widget.job.jobLocation,
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
              '\$ ' + widget.job.jobPrice,
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
      width: 400,
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
