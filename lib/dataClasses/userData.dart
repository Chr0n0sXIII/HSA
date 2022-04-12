import "package:flutter/material.dart";
import 'dart:ui';
import 'package:home_service_app/dataClasses/jobData.dart';

class userData {
  String uName;
  String email;
  String about;
  String contacts;
  String skills;
  List<String> activeRequests;
  String activeJob;
  var clientRating;
  var workerRating;
  String pfp;

  userData(
      {required this.uName,
      required this.email,
      required this.about,
      required this.contacts,
      required this.skills,
      required this.activeRequests,
      required this.activeJob,
      required this.clientRating,
      required this.workerRating,
      required this.pfp});

  Map<String, dynamic> toMap() {
    return {
      'uName': uName,
      'email': email,
      'about': about,
      'contacts': contacts,
      'skills': skills,
      'activeRequests': activeRequests,
      'activeJob': activeJob,
      'clientRating': clientRating,
      'workerRating': workerRating,
      'pfp': pfp,
    };
  }
}
