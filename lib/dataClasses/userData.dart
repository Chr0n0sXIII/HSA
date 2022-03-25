import "package:flutter/material.dart";
import 'dart:ui';

class userData {
  String uName;
  String email;
  String about;
  String contacts;
  List<String> skills;
  var clientRating;
  var workerRating;
  Image pfp;

  userData(
      {required this.uName,
      required this.email,
      required this.about,
      required this.contacts,
      required this.skills,
      required this.clientRating,
      required this.workerRating,
      required this.pfp});
}
