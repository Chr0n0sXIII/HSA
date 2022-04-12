import 'dart:html';

import 'package:flutter/material.dart';

class User {
  String uName = "Jiles Ramjattan";
  String email = "jilesramjattan@gmail.com";
  String about = "Na";
  String contacts = "Na";
  String skills = "";
  List<String> activeRequests = [""];
  List<String> completedRequests = [""];
  List<String> completedJobs = [""];
  String activeJob = "";
  double clientRating = 0;
  double workerRating = 0;
  Image pfpImage = Image.asset("assets/profile_picture_place_holder.png");
  String pfp = "";

  User(
      {required this.uName,
      required this.email,
      required this.about,
      required this.contacts,
      required this.skills,
      required this.activeRequests,
      required this.completedRequests,
      required this.activeJob,
      required this.completedJobs,
      required this.clientRating,
      required this.workerRating,
      required this.pfp,
      required this.pfpImage});

  setUname(String uName) {
    this.uName = uName;
  }

  setemail(String email) {
    this.email = email;
  }

  setabout(String about) {
    this.about = about;
  }

  setcontacts(String contacts) {
    this.contacts = contacts;
  }

  setskills(String skills) {
    this.skills = skills;
  }

  setactiveRequest(List<String> Requests) {
    this.activeRequests = Requests;
  }

  setactiveJob(String job) {
    this.activeJob = job;
  }

  setclientRating(var clientRating) {
    this.clientRating = clientRating;
  }

  setworkerRating(var workerRating) {
    this.workerRating = workerRating;
  }

  setpfp(String pfp) {
    this.pfp = pfp;
  }

  toMap() {
    return {
      uName: uName,
      email: email,
      about: about,
      contacts: contacts,
      skills: skills,
      activeRequests: activeRequests,
      completedRequests: completedRequests,
      activeJob: activeJob,
      completedJobs: completedJobs,
      clientRating: clientRating,
      workerRating: workerRating,
      pfp: pfp
    };
  }
}
