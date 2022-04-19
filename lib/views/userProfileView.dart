import 'package:home_service_app/views/responsive.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';
import 'package:home_service_app/views/widgets/userProfile_FormWidget.dart';

import '../dataClasses/User.dart';

class UserProfileView extends StatefulWidget {
  final User user;
  const UserProfileView({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopBar(user: widget.user,),
              PageTitle("User Profile"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileForm(user: widget.user,),
                ],
              ),
              Footer()
            ],
          ),
        ),
      );
    }
    return Scaffold();
  }
}
