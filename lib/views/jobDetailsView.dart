import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/jobDetails_ImageWidget.dart';
import 'package:home_service_app/views/widgets/jobDetails_InfoWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

class jobDetailsView extends StatelessWidget {
  List<String> imageURL_List = <String>[
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/id/237/200/300'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          TopBar(),
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
