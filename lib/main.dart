import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/views/views.dart';

void main() {
  runApp( MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Add_New_Job_View(),
    );
  }
}
