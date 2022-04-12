import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/jobDetails_ImageWidget.dart';
import 'package:home_service_app/views/widgets/jobDetails_InfoWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class jobDetailsView extends StatelessWidget {
  final User user;
  const jobDetailsView({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          TopBar(user: user,),
          PageTitle(" Job Details"),
          Padding(
            padding: const EdgeInsets.only(left: 250,right: 250),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                jobDetails_ImageWidget(imagelist: imageURL_List),
                jobDetails_InfoWidget(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
