// ignore: file_names
import 'package:flutter/material.dart';

class LoginBannerWidget extends StatelessWidget {
  const LoginBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 30, 81, 1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/app_logo.png'),
              SizedBox(
                height: 100,
              ),
              Text(
                "Home Service App",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(195, 166, 96, 1),
                    fontSize: 60),
              ),
              Text(
                "Chores Done Simply",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ], //children
          )
        ],
      ),
    );
  }
}
