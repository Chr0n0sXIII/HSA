import 'package:home_service_app/views/responsive.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/userProfile_FormWidget.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

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
              TopBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileForm(),
                ],
              ),
              Footer()
            ],
          ),
        ),
      );
    }
    return Scaffold(

    );
  }
}
