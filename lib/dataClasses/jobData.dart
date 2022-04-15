

import "package:flutter/material.dart";
import 'package:latlng/latlng.dart';

class JobData {
  String jobID;
  String jobName;
  String jobDescription;
  String jobLocation;
  String jobType;
  LatLng latLng;
  String jobPrice;
  Icon pin;
  List<String> ActiveJobImages;
  List<String> CompletedJobImages;
  bool isCompleted;

  JobData({
    required this.jobID,
    required this.jobName,
    required this.jobDescription,
    required this.jobLocation,
    required this.jobType,
    required this.latLng,
    required this.jobPrice,
    this.pin = const Icon(
      Icons.pin_drop,
      color: Colors.red,
    ),
    required this.ActiveJobImages,
    required this.CompletedJobImages,
    this.isCompleted = false,
  });

  toMap() {
    return {
      'jobID': jobID,
      'jobName': jobName,
      'jobDescription': jobDescription,
      'ActiveJobImages': ActiveJobImages,
      'CompletedJobImages': CompletedJobImages,
      'jobLocation': jobLocation,
      'jobType':jobType,
      'latLng': latLng.latitude.toString()+latLng.longitude.toString(),
      //'pin': pin,
      'jobPrice': jobPrice,
      'isCompleted': isCompleted,
    };
  }

  
}
