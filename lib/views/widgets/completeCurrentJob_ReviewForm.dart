import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:io' show File;

import '../../dataClasses/User.dart';

class Complete_Job_Form extends StatefulWidget {
  final User user;
  final JobData job;
  const Complete_Job_Form({Key? key, required this.user, required this.job})
      : super(key: key);

  @override
  State<Complete_Job_Form> createState() => _Complete_Job_FormState();
}

class _Complete_Job_FormState extends State<Complete_Job_Form> {
  final staticImage = 'https://static.thenounproject.com/png/3322766-200.png';
  bool imageUploaded = false;
  bool imageLoadedFromWorker = false;
  final controller = CarouselController();
  List<String> imageURL_list = <String>[];
  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? image = <XFile>[];
  List<XFile> ImageList = <XFile>[];
  String? review_Error;
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.job.ActiveJobImages.length > 0) {
      imageLoadedFromWorker = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 0, 250, 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 47, 8, 8),
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageLoadedFromWorker == false
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
                                final workerImageURL =
                                    widget.job.ActiveJobImages[index];
                                return buildWorkerImage(workerImageURL, index);
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Proof of Completion',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 400,
                    child: imageUploaded == false
                        ? InkWell(
                            onTap: pickImagesFromDevice,
                            hoverColor: Colors.transparent,
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(196, 196, 196, 1)),
                              child: Image(image: NetworkImage(staticImage)),
                            ),
                          )
                        : Column(
                            children: [
                              InkWell(
                                onTap: pickImagesFromDevice,
                                hoverColor: Colors.transparent,
                                child: CarouselSlider.builder(
                                    carouselController: controller,
                                    itemCount: imageURL_list.length,
                                    itemBuilder: (context, index, realIndex) {
                                      final imageURL = imageURL_list[index];
                                      return buildImage(imageURL, index);
                                    },
                                    options: CarouselOptions(
                                      height: 500,
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      enableInfiniteScroll: false,
                                      onPageChanged: (index, reason) =>
                                          setState(() => activeIndex = index),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(15),
                                            primary:
                                                Color.fromRGBO(4, 30, 81, 1)),
                                        onPressed: back,
                                        child: Icon(Icons.arrow_back)),
                                    buildImageIndicator(),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(15),
                                            primary:
                                                Color.fromRGBO(4, 30, 81, 1)),
                                        onPressed: next,
                                        child: Icon(Icons.arrow_forward))
                                  ],
                                ),
                              )
                            ],
                          )),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Client Review',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(7.0, 8.0))
                  ]),
                  child: TextField(
                    maxLines: 5,
                    maxLength: 250,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Write your review...',
                        errorText: review_Error,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color.fromRGBO(195, 166, 96, 1),
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(
                          11,
                          206,
                          131,
                          1,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20))),
                    onPressed: submit,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  void submit() {}

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

  void pickImagesFromDevice() async {
    image = await _picker.pickMultiImage();
    imageURL_list.clear();
    ImageList.clear();
    if (image != null) {
      setState(() {
        ImageList = ImageList + image!;
        addImage();
        image!.clear();
      });
    }
    imageUploaded = true;
  }

  void addImage() {
    for (var bytes in image!) {
      imageURL_list.add(File(bytes.path).path.toString());
    }
  }

  void back() {
    controller.previousPage();
  }

  void next() {
    controller.nextPage();
  }

  buildImageIndicator() {
    return AnimatedSmoothIndicator(
      onDotClicked: moveToImage,
      activeIndex: activeIndex,
      count: imageURL_list.length,
      effect:
          ScrollingDotsEffect(activeDotColor: Color.fromRGBO(195, 166, 96, 1)),
    );
  }

  moveToImage(int index) {
    controller.animateToPage(index);
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
