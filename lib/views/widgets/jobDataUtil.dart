import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:home_service_app/views/widgets/jobData.dart';
import 'package:flutter/material.dart';

class JobDataUtil {
  static List<JobData> TestData_JobsData() {
    return [
      JobData(
          jobName: "Cut Grass",
          jobDescription: " I have a lawn to cut not too big ",
          jobLocation: "San Juan",
          jobPrice: "\$500",
          pin: Icon(
            Icons.pin_drop,
            color: Colors.red,
          ),
          jobImage:
              Image.asset("assets/featured-image-cheap-landscaping.jpeg")),
      JobData(
          jobName: "Water plants Daily",
          jobDescription:
              "I am looking for someone to come water my garden daily",
          jobLocation: "Santa Rosa",
          jobPrice: "\$200",
          pin: Icon(
            Icons.pin_drop,
            color: Colors.red,
          ),
          jobImage:
              Image.asset("assets/featured-image-cheap-landscaping.jpeg")),
      JobData(
          jobName: "Repair water lines",
          jobDescription:
              "My son Damaged a tap in the yard i need it to be repaired asap",
          jobLocation: "San Juan",
          jobPrice: "\$250",
          pin: Icon(
            Icons.pin_drop,
            color: Colors.red,
          ),
          jobImage:
              Image.asset("assets/featured-image-cheap-landscaping.jpeg")),
      JobData(
          jobName: "Paint Walls",
          jobDescription:
              " I have a large brick fence surrounding my house that needs a fresh coat of paint, Tools are provided",
          jobLocation: "San Juan",
          jobPrice: "\$500",
          pin: Icon(
            Icons.pin_drop,
            color: Colors.red,
          ),
          jobImage:
              Image.asset("assets/featured-image-cheap-landscaping.jpeg")),
      JobData(
          jobName: "Clean Pool",
          jobDescription:
              "We haven't used the pool in a while so it's pretty dirty",
          jobLocation: "Port of Spain",
          jobPrice: "\$500",
          pin: Icon(
            Icons.pin_drop,
            color: Colors.red,
          ),
          jobImage:
              Image.asset("assets/featured-image-cheap-landscaping.jpeg")),
    ];
  }
}
