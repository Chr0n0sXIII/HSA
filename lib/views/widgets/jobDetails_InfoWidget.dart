import 'package:flutter/cupertino.dart';
import 'package:home_service_app/dataClasses/userData.dart';
import 'package:home_service_app/dataClasses/userDataUtil.dart';

class jobDetails_InfoWidget extends StatefulWidget {
  userData udata = UserDataUtil.TestData_UserData()[1];
  @override
  jobDetails_InfoWidget_State createState() => jobDetails_InfoWidget_State();
}

class jobDetails_InfoWidget_State extends State<jobDetails_InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Column(
          children: [
            Text(widget.udata.uName),
          ],
        ),
      ]),
    );
    // TODO: implement build
  }
}
