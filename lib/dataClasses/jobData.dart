import "package:flutter/material.dart";
import 'dart:ui';

class JobData {
  String jobID;
  String jobName;
  String jobDescription;
  String jobLocation;
  String jobPrice;
  Icon pin;
  Image jobImage;

  JobData({
    required this.jobID,
    required this.jobName,
    required this.jobDescription,
    required this.jobLocation,
    required this.jobPrice,
    this.pin = const Icon(
      Icons.pin_drop,
      color: Colors.red,
    ),
    required this.jobImage,
  });
}
