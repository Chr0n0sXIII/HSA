import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

class jobListingView extends StatefulWidget {
  const jobListingView({Key? key}) : super(key: key);

  @override
  State<jobListingView> createState() => _jobListingViewState();
}

class _jobListingViewState extends State<jobListingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageTitle('Job Listings'),
            searchBar(),
            Row(
              children: [jobListingMapView(), jobList()],
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  searchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 250,right: 250),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search Job...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  jobListingMapView() {
    return Container();
  }

  jobList() {
    return Container();
  }
}
