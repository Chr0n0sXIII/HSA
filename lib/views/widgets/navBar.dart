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
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text ('Home',
                  style: TextStyle(
                      color: Color.fromRGBO(195, 166, 96, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    )
                ),
                SizedBox(width: 60,),
                Text('Job Listings',
                  style: TextStyle(
                      color: Color.fromRGBO(195, 166, 96, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    )
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(''),
                ),
                const Text('Username',
                  style: TextStyle(
                    color: Color.fromRGBO(195, 166, 96, 1),
                    fontWeight: FontWeight.bold,
                  )
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}