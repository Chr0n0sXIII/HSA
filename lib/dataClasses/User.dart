import 'package:flutter/material.dart';

class User {
  late String user_ID;
  late String uName;
  late String userPassword;
  late String email;
  late String about;
  late String contacts;
  late String skills;
  late List<String> activeJobs;
  late List<String> completedJobs;
  late String currentJobTaken;
  late double userRating;
  late String pfp;

  User({
    required this.user_ID,
    required this.uName,
    required this.userPassword,
    required this.email,
    required this.about,
    required this.contacts,
    required this.skills,
    required this.activeJobs,
    required this.currentJobTaken,
    required this.completedJobs,
    required this.userRating,
    required this.pfp,
  });

  User.register(String userID, String name, String Uemail, String password) {
    user_ID = userID;
    uName = name;
    email = Uemail;
    userPassword = password;
    about = "Na";
    contacts = "Na";
    skills = "Na";
    activeJobs = [""];
    completedJobs = [""];
    currentJobTaken = "";
    userRating = 0;
    pfp =
        "https://firebasestorage.googleapis.com/v0/b/homeserviceapp-a9232.appspot.com/o/profile_picture_place_holder.png?alt=media&token=3bf2e229-8307-4992-9e5d-e21c451df858";
  }

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

  setactiveRequest(List<String> activeJobs) {
    this.activeJobs = activeJobs;
  }

  setactiveJob(String currentJobTaken) {
    this.currentJobTaken = currentJobTaken;
  }

  setclientRating(var clientRating) {
    this.userRating = clientRating;
  }

  setpfp(String pfp) {
    this.pfp = pfp;
  }

  addJob(String jobID) {
    activeJobs.add(jobID);
  }

  removeActiveJob(String jobID) {
    activeJobs.remove(jobID);
  }

  addCompletedJob(String jobID) {
    completedJobs.add(jobID);
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': user_ID,
      'Name': uName,
      'Email': email,
      'Password': userPassword,
      'About': about,
      'Contacts': contacts,
      'Skills': skills,
      'Active_Jobs': activeJobs,
      'Current_Job_Taken': currentJobTaken,
      'Completed_Jobs': completedJobs,
      'User_Rating': userRating,
      'Profile_Picture': pfp
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    print('\nID : ' +
        this.user_ID +
        '\nName : ' +
        this.uName +
        '\nEmail : ' +
        this.email +
        '\nContact : ' +
        this.contacts +
        '\nAbout : ' +
        this.about +
        '\nSkils : ' +
        this.skills +
        '\nRating : ' +
        this.userRating.toString() +
        '\nActive Jobs : ' +
        activeJobs.toString() +
        '\nCompleted Jobs : ' +
        this.completedJobs.toString() +
        '\nCurrent Job Taken : ' +
        this.currentJobTaken);
    return super.toString();
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
        user_ID: json['ID'],
        uName: json['Name'],
        email: json['Email'],
        userPassword: json['Password'],
        about: json['About'],
        contacts: json['Contacts'],
        skills: json['Skills'],
        activeJobs: json['Active_Jobs'].cast<String>(),
        completedJobs: json['Completed_Jobs'].cast<String>(),
        currentJobTaken: json['Current_Job_Taken'],
        userRating: json['User_Rating'],
        pfp: json['Profile_Picture']);
  }
}
