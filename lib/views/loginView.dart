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
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 1350,
                  width: 850,
                  child: LoginBannerWidget(),
                ),
              )
            ]),
            SizedBox(
              width: 60,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 750,
                  width: 480,
                  child: LoginWidget(),
                ),
              ),
            ]),
          ],
        ));
    // TODO: implement build
    throw UnimplementedError();
  }
}
