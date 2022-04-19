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
      completedRequests: ['completedRequests'],
      completedJobs: ['completedJobs'],
      pfp: 'pfp',
      activeJobs: ["activeJobs"],
      currentJobTaken: 'currentJobTaken',
      user_ID: 'user_ID',
      userPassword: 'userPassword',
      userRating: 0.00,
    );
    final map = user.toJson();

    expect(map["Name"], 'uName');
    expect(map["Email"], 'email');
    expect(map["About"], 'about');
    expect(map["Contacts"], 'contacts');
    expect(map["Skills"], 'skills');
    expect(map['Completed_Request'], ['completedRequests']);
    expect(map['Completed_Jobs'], ['completedJobs']);
    expect(map['Profile_Picture'], 'pfp');
    expect(map['Active_Jobs'], ['activeJobs']);
    expect(map['Current_Job_Taken'], 'currentJobTaken');
    expect(map['ID'], 'user_ID');
    expect(map['Password'], 'userPassword');
    expect(map['User_Rating'], 0.00);

    final dclass = User.fromJson(map);

    expect(dclass.about, user.about);
    expect(dclass.activeJobs, user.activeJobs);
    expect(dclass.completedJobs, user.completedJobs);
    expect(dclass.completedRequests, user.completedRequests);
    expect(dclass.contacts, user.contacts);
    expect(dclass.currentJobTaken, user.currentJobTaken);
    expect(dclass.email, user.email);
    expect(dclass.pfp, user.pfp);
    expect(dclass.skills, user.skills);
    expect(dclass.uName, user.uName);
    expect(dclass.userPassword, user.userPassword);
    expect(dclass.userRating, user.userRating);
    expect(dclass.user_ID, user.user_ID);
    
  });
}
