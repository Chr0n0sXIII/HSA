import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:io' show File;

class Complete_Job_Form extends StatefulWidget {
  const Complete_Job_Form({Key? key}) : super(key: key);

  @override
  State<Complete_Job_Form> createState() => _Complete_Job_FormState();
}

class _Complete_Job_FormState extends State<Complete_Job_Form> {
  bool imageUploaded = false;
  final staticImage = 'https://static.thenounproject.com/png/3322766-200.png';

  String? review_Error;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(196, 196, 196, 1)),
                        child: Image(image: NetworkImage(staticImage)),
                      )
                    : Column())
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
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(11, 206, 131, 1,),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20)
                  )
                ),
                onPressed: submit, 
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ],
    );
  }

  void submit() {
  }
}
