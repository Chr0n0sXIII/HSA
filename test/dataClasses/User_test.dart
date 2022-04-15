import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_service_app/dataClasses/User.dart';

void main() {
  test("Test User Data toMap", () {
    User user = User(
        uName: 'uName',
        email: 'email',
        about: 'about',
        contacts: 'contacts',
        skills: 'skills',
        activeRequests: ['activeRequests'],
        completedRequests: ['completedRequests'],
        activeJob: 'activeJob',
        completedJobs: ['completedJobs'],
        clientRating: 0,
        workerRating: 0,
        pfp: 'pfp',
        pfpImage: Image.asset("assets/profile_picture_place_holder.png"));

    final map = user.toMap();

    expect(map["uName"], 'uName');
    expect(map["email"], 'email');
    expect(map["about"], 'about');
    expect(map["contacts"], 'contacts');
    expect(map["skills"], 'skills');
    expect(map['activeRequests'], ['activeRequests']);
    expect(map['completedRequests'], ['completedRequests']);
    expect(map['activeJob'], 'activeJob');
    expect(map['completedJobs'], ['completedJobs']);
    expect(map['clientRating'], 0);
    expect(map['pfp'], 'pfp');
  });
}