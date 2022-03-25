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
      ],
    );
  }
}
