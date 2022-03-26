import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/jobDetails_ImageWidget.dart';
import 'package:home_service_app/views/widgets/jobDetails_InfoWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';

class jobDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          NavBar(),
          Row(
            children: [
              jobDetails_ImageWidget(image: [
                Image.asset("assets/app_logo.png"),
                Image.asset("assets/featured-image-cheap-landscaping.jpeg"),
                Image.asset("assets/profile_picture_place_holder.png")
              ]),
              jobDetails_InfoWidget(),
            ],
          )
        ]),
      ),
    );
  }
}
