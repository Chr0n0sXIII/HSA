import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Color.fromRGBO(4, 31, 81, 1),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assets/app_logo.png'),
          )
        ]
      ),
    );
  }
}