import "package:flutter/material.dart";
import 'dart:ui';

class JobData {
  String jobName;
  String jobDescription;
  String jobLocation;
  String jobPrice;
  Icon pin;
  Image jobImage;

  JobData({
    required this.jobName,
    required this.jobDescription,
    required this.jobLocation,
    required this.jobPrice,
    required this.pin,
    required this.jobImage,
  });
}
