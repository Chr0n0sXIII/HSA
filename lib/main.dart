import 'package:flutter/material.dart';
import 'package:home_service_app/views/views.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_ScrollWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AcceptWorkerView());
  }
}
