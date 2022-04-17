import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../dataClasses/User.dart';
import '../../dataClasses/jobData.dart';

class Worker_Review_Fo extends StatefulWidget {
  final User user;
  final JobData job;
  const Worker_Review_Fo({Key? key, required this.user, required this.job})
      : super(key: key);

  @override
  State<Worker_Review_Fo> createState() => _Worker_Review_FoState();
}

class _Worker_Review_FoState extends State<Worker_Review_Fo> {
  final controller = CarouselController();
  List<String> imageURL_list = <String>[];
  bool imagesLoaded = false;
  int activeIndex = 0;

  String? review_Error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.job.CompletedJobImages.length > 0) {
      imagesLoaded = true;
      imageURL_list = widget.job.CompletedJobImages;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 25, 250, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Images From Worker',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  width: 400,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(196, 196, 196, 1)),
                  child: imagesLoaded == false
                      ? Center(child: CircularProgressIndicator())
                      : CarouselSlider.builder(
                          carouselController: controller,
                          itemCount: widget.job.CompletedJobImages.length,
                          itemBuilder: (context, index, realIndex) {
                            final imageURL =
                                widget.job.CompletedJobImages[index];
                            return buildImage(imageURL, index);
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ))),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              primary: Color.fromRGBO(4, 30, 81, 1)),
                          onPressed: back,
                          child: Icon(Icons.arrow_back)),
                      buildImageIndicator(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              primary: Color.fromRGBO(4, 30, 81, 1)),
                          onPressed: next,
                          child: Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Worker Review',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color.fromRGBO(195, 166, 96, 1),
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(11, 206, 131, 1),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  back() {
    if (imagesLoaded == true) {
      controller.previousPage();
    }
  }

  next() {
    if (imagesLoaded == true) {
      controller.nextPage();
    }
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
}
