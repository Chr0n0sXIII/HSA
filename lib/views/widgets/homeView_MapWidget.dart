import 'dart:io';
import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    String jobDesc = "No Current Job Taken";
    return Container(
      height: 580,
      width: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(7.0,8.0)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 70,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
              child: Text(
              jobDesc,
              style: const TextStyle( 
                color: Colors.black,
                fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(196, 196, 196, 1),
                borderRadius: BorderRadius.all(Radius.circular(45))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Looking For A Job',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: const Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
