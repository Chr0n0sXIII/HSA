import 'dart:html';

import "package:flutter/material.dart";
import 'package:latlng/latlng.dart';
import 'dart:ui';

class JobData {
  String jobID;
  String jobName;
  String jobDescription;
  String jobLocation;
  LatLng latLng;
  String jobPrice;
  Icon pin;
  List<String> JobImages;

  JobData({
    required this.jobID,
    required this.jobName,
    required this.jobDescription,
    required this.jobLocation,
    required this.latLng,
    required this.jobPrice,
    this.pin = const Icon(
      Icons.pin_drop,
      color: Colors.red,
    ),
    required this.JobImages,
  });

  toMap() {
    return {
      jobID: jobID,
      jobName: jobName,
      jobDescription: jobDescription,
      JobImages: JobImages,
      jobLocation: jobLocation,
      latLng: latLng,
      pin: pin,
      jobPrice: jobPrice,
    };
  }
}
