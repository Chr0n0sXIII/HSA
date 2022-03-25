import 'package:flutter/material.dart';

class editJobView extends StatelessWidget {
  const editJobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => const FlutterLogo(),
      itemCount: 4,
    );
  }
}
