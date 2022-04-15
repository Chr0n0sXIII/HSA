import 'dart:convert';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:geocode/geocode.dart';
import 'package:latlng/latlng.dart';
import 'dart:ui';

class JobData {
  String jobID;
  String jobName;
  String jobDescription;
  String jobLocation;
  String? jobType;
  double Latitude;
  double Longitude;
  String jobPrice;
  List<String> ActiveJobImages;
  List<String> CompletedJobImages;
  bool isCompleted;

  JobData({
    required this.jobID,
    required this.jobName,
    required this.jobDescription,
    required this.jobLocation,
    required this.jobType,
    required this.Latitude,
    required this.Longitude,
    required this.jobPrice,
    required this.ActiveJobImages,
    required this.CompletedJobImages,
    this.isCompleted = false,
  });

  Map<String, dynamic> ledgerItem(String amount, String type) {
    var amountDouble = double.parse(amount);
    if (type == "spent") {
      amountDouble = double.parse("-" + amount);
    }
    return {
      'ledger': FieldValue.arrayUnion([
        {
          "date": DateTime.now(),
          "amount": amountDouble,
        },
      ]),
      'saved': FieldValue.increment(amountDouble)
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'Job_ID': jobID,
      'Title': jobName,
      'Description': jobDescription,
      'Address': jobLocation,
      'Type': jobType,
      'Latitude': Latitude,
      'Longitude': Longitude,
      'Price': jobPrice,
      'Active_Job_Images': ActiveJobImages,
      'Completed_Job_Images': CompletedJobImages,
      'isCompleted': isCompleted
    };
  }

  static JobData fromJson(Map<String, dynamic> json) {
    return JobData(
        jobID: json['Job_ID'],
        jobName: json['Title'],
        jobDescription: json['Description'],
        jobLocation: json['Address'],
        jobType: json['Type'],
        Latitude: json['Latitude'],
        Longitude: json['Longitude'],
        jobPrice: json['Price'],
        ActiveJobImages: json['Active_Job_Images'].cast<String>(),
        CompletedJobImages: json['Completed_Job_Images'].cast<String>(),
        isCompleted: json['isCompleted']
        );
  }
}
