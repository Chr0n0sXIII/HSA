import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/userData.dart';

class UserDataUtil {
  static List<userData> TestData_UserData() {
    return [
      userData(
        uName: "Tommy Lee",
        email: "TommyLee@yahoo.com",
        about: "I am Tommy",
        contacts: "(868) 222 4431, (868) 123 1242",
        skills: "Mason, Plumber",
        clientRating: 3,
        workerRating: 4,
        pfp: Image.asset("assets/profile_picture_place_holder.png"),
      ),
      userData(
          uName: "Alex Mason",
          email: "AlexM@gmail.com",
          about: "This is Alex",
          contacts: "2353243",
          skills: "skills, LandScaping",
          clientRating: 2,
          workerRating: 2,
          pfp: Image.asset("assets/profile_picture_place_holder.png"))
    ];
  }
}
