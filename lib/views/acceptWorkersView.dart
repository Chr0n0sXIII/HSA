import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_JobDesc.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_ScrollWidget.dart';

class AcceptWorkersView extends StatelessWidget {
  const AcceptWorkersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // pull data
    //place in dictionary

    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const NavBar(),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    child: JobDesc(),
                  )
                ],
              ),
              Column(
                children: [
                  //listveiw()
                  acceptWorkers_Scollwidget(),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
