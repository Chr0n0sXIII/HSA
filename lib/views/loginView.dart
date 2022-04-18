import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/loginBannerWidget.dart';
import 'package:home_service_app/views/widgets/loginWidget.dart';

class loginView extends StatelessWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: LoginBannerWidget()
            ),
            Expanded(
              flex: 1,
              child: LoginWidget(),
            ),
          ],
        ));
    // TODO: implement build
  }
}
