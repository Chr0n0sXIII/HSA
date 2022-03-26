import 'package:flutter/material.dart';

class JobDesc_edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("app_logo.png"),
        const Text("name of job"),
        const Text("job description"),
        const Text("location"), // map tag icon
        const Text("price"),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(11, 206, 131, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () {
                print('Clicked on accept');
              },
              child: const Text('Accept'),
            )
          ],
        )
      ],
    );
  }
}
