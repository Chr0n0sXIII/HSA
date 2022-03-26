import 'package:flutter/material.dart';

class JobDesc extends StatelessWidget {
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

class JobDesc_listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("app_logo.png"),
        Column(
          children: const [
            Text("name of job"),
            Text("job description"),
            Text("location"), // map tag icon
            Text("price"),
          ],
        )
      ],
    );
  }
}
