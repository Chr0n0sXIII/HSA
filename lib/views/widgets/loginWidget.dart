import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  var email = "";
  var password = "";

  LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Email",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(195, 166, 96, 1),
              fontSize: 60),
        ),
        TextField(
          onChanged: (text) {
            email = text;
          },
        )
      ],
    );
  }
}
