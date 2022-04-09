import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Worker_Review_Fo extends StatefulWidget {
  const Worker_Review_Fo({ Key? key }) : super(key: key);

  @override
  State<Worker_Review_Fo> createState() => _Worker_Review_FoState();
}

class _Worker_Review_FoState extends State<Worker_Review_Fo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(196, 196, 196, 1)
              ),
              child: Center(
                child: CircularProgressIndicator()
              ),
            )
          ],
        ),
        Column(),
      ],
    );
  }
}