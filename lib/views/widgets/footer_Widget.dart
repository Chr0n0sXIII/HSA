import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 51, 51, 1),
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Text(
                    'Terms Of Service',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white ,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Demo Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}

