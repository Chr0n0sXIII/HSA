import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/editJob_TileWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

import '../dataClasses/User.dart';

class editJobView extends StatefulWidget {
  final User user;
  const editJobView({Key? key, required this.user}) : super(key: key);

  @override
  State<editJobView> createState() => _editJobViewState();
}

class _editJobViewState extends State<editJobView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(user: widget.user,),
            PageTitle('View Your Current Jobs and Edit'),
            editJobTileListing(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
