import 'package:flutter/material.dart';
import 'package:home_service_app/DbHelper/MongoDB.dart';
import 'package:home_service_app/views/homeView.dart';
import 'package:home_service_app/views/loginView.dart';
import 'package:home_service_app/views/views.dart';
import 'package:home_service_app/views/jobListingView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDb.connect();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: jobListingView(),
    );
  }
}
