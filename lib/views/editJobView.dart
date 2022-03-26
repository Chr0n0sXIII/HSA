import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/acceptWorkers_JobDesc.dart';
import 'package:home_service_app/views/widgets/editJob_TileWidget.dart';

class editJobView extends StatelessWidget {
  const editJobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (_, index) =>
          Container(height: 400, width: 400, child: JobDesc_edit()),
      itemCount: 8,
    );
  }
}
