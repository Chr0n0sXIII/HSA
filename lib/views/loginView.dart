import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/loginBannerWidget.dart';
import 'package:home_service_app/views/widgets/loginWidget.dart';

class loginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 1080,
            width: 900,
            child: LoginBannerWidget(),
          ),
          SizedBox(
            height: 1080,
            width: 600,
            child: Column(
              children: [
                LoginWidget(),
              ],
            ),
          ),
        ]),
      ],
    ));
    // TODO: implement build
    throw UnimplementedError();
  }
}
