import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jobDetails_ImageWidget extends StatefulWidget {
  List<Image>? image;
  int index = 0;

  jobDetails_ImageWidget({
    required this.image,
  });

  @override
  jobDetails_ImageWidget_state createState() => jobDetails_ImageWidget_state();
}

class jobDetails_ImageWidget_state extends State<jobDetails_ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: Colors.grey[400],
      child: CarouselSlider(
          items: widget.image,
          options: CarouselOptions(
            height: 500,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
