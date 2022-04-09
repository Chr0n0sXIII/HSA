import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/jobData.dart';

class JobListingCard extends StatelessWidget {
  JobData? jobData;
  Function? onCardClick;
  Image image = Image.asset('assets/featured-image-cheap-landscaping.jpeg');

  JobListingCard({
    this.jobData,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, 10),
                    blurRadius: 5.0,
                    spreadRadius: 0)
              ]),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: image,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          jobData!.jobName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 400,
                              height: 100,
                              child: Text(
                                jobData!.jobDescription,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Color.fromRGBO(136, 134, 134, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 30,
                          child: jobData!.pin,
                        ),
                        Text(
                          jobData!.jobLocation,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          jobData!.jobPrice,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 229, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
