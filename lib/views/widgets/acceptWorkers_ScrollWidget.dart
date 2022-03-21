import 'package:flutter/material.dart';

class acceptWorkers_Scollwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 200,
          width: 700,
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Row(
            children: [
              Image.asset("profile_picture_place_holder.png"),
              Column(
                children: const [
                  Text('rating:'),
                  Text('name:'),
                  Text('specializations:'),
                  Text('description:'),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Clicked on accept');
                    },
                    child: const Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Clicked on reject');
                    },
                    child: const Text('Reject'),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          //userProileVeiw
        });
  }
}
