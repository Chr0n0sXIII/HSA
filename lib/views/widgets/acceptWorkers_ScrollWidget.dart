import 'package:flutter/material.dart';

class acceptWorkers_Scollwidget extends StatelessWidget {
  final worker;
  const acceptWorkers_Scollwidget(this.worker);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 200,
          width: 700,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Row(
            children: [
              Image.network(worker['imageUrl']),
              Column(
                children: [
                  Text(worker['name']),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(11, 206, 131, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      print('Clicked on accept');
                    },
                    child: const Text('Accept'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(244, 67, 54, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
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
        onTap: () {} //userProileVeiw
        );
  }
}
