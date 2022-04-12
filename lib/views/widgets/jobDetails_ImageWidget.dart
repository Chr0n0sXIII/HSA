import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jobDetails_ImageWidget extends StatefulWidget {
  List<String>? imagelist = <String>[];
  int activeIndex = 0;

  jobDetails_ImageWidget({
    required this.imagelist,
  });

  @override
  jobDetails_ImageWidget_state createState() => jobDetails_ImageWidget_state();
}

class jobDetails_ImageWidget_state extends State<jobDetails_ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: widget.imagelist!.length,
              itemBuilder: (context, index, realIndex) {
                final imageURL = widget.imagelist![index];
                return buildImage(imageURL, index);
              },
              options: CarouselOptions(
                height: 500,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
              )
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: Color.fromRGBO(4, 30, 81, 1)
                ),
                onPressed: back, 
                child: Icon(Icons.arrow_back)
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: Color.fromRGBO(4, 30, 81, 1)
                ),
                onPressed: next, 
                child: Icon(Icons.arrow_forward)
              )
            ],
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

  void back() {
  }

  void next() {
  }
}
