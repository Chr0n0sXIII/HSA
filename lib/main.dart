import 'package:flutter/material.dart';
import 'package:home_service_app/views/views.dart';
import 'package:home_service_app/views/jobListingView.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //MongoDb.connect();
  //mongo.initCredentials();
  //db.initJData();
  //db.initUData();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _init = Firebase.initializeApp(
      options: const FirebaseOptions(
          appId: "1:755962750753:web:056189e85f45940d960060",
          apiKey: "AIzaSyBM191eFTX-6xhhhf45y4pHo52GLv0yc8k",
          projectId: "homeserviceapp-a9232",
          messagingSenderId: "755962750753",
          authDomain: "homeserviceapp-a9232.firebaseapp.com",
          storageBucket: "homeserviceapp-a9232.appspot.com",
          measurementId: "G-DY7PN83H48"));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeView();
          }
          return CircularProgressIndicator();
        },
      ),

      //jobListingView(),
    );
  }
}
