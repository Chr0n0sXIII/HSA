import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:io' show File;


class Complete_Job_Form extends StatefulWidget {
  const Complete_Job_Form({ Key? key }) : super(key: key);

  @override
  State<Complete_Job_Form> createState() => _Complete_Job_FormState();
}

class _Complete_Job_FormState extends State<Complete_Job_Form> {
  bool imageUploaded = false;
  final staticImage = 'https://static.thenounproject.com/png/3322766-200.png';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(),
        Column(
          children: [
            Text(
              'Proof of Completion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 400,
              height: 500,
              child: imageUploaded == false
              ?Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(196, 196, 196, 1)
                ),
                child: Image(image: NetworkImage(staticImage)),
              )
              :Column()
            )
          ],
        ),
      ],
    );
  }
}