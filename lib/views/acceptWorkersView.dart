// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_JobDesc.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_ScrollWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AcceptWorkerView extends StatelessWidget {
  var workers = [1, 2, 3, 4, 5];
  var itemCount;
  // _fecthData() async {
  //   const url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final map = jsonDecode(response.body);
  //     final workersJson = map['videos'];
  //     workers = workersJson;
  //     print(workers);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    itemCount = this.workers != null ? this.workers.length : 0;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
        body: SingleChildScrollView(
            child: Column(children: [
          const NavBar(),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    child: JobDesc(),
                  )
                ],
              ),
              Column(
                children: [
                  if (itemCount > 0)
                    ListView.builder(
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int i) {
                        //final worker = workers[i];
                        return acceptWorkers_Scollwidget(workers[i]);
                      },
                    )
                  else
                    Column(
                      children: [
                        Container(
                            height: 500,
                            width: 400,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            child: const Text('No items')),
                      ],
                    ),
                ],
              ),
            ],
          )
        ])));
  }
}
