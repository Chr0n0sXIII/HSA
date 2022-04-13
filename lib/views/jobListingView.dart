import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';

class jobListingView extends StatefulWidget {
  const jobListingView({Key? key}) : super(key: key);

  @override
  State<jobListingView> createState() => _jobListingViewState();
}

class _jobListingViewState extends State<jobListingView> {
  List<String> job_Types = [
    'Yark Work',
    'Cleaning',
    'Landscaping',
    'Painting',
    'Maintainace',
    'Plumbing',
    'Misc'
  ];
  List<String> job_Distance = ['Closest', 'Farthest'];
  List<String> job_Prices = ['Low - High', 'High - Low'];
  String? selected_Type = 'Plumbing';
  String? selected_Distance = 'Closest';
  String? selected_Price = 'Low - High';
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
      padding: const EdgeInsets.only(left: 250, right: 250),
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
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
              flex: 1,
              child: DropdownButtonHideUnderline(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                      focusColor: Colors.transparent,
                      value: selected_Type,
                      items: job_Types
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(item),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                            selected_Type = item;
                          })),
                ),
              )),
          Expanded(
              flex: 1,
              child: DropdownButtonHideUnderline(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                      focusColor: Colors.transparent,
                      value: selected_Distance,
                      items: job_Distance
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(item),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                            selected_Distance = item;
                          })),
                ),
              )),
          Expanded(
              flex: 1,
              child: DropdownButtonHideUnderline(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                      focusColor: Colors.transparent,
                      value: selected_Price,
                      items: job_Prices
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(item),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                            selected_Price = item;
                          })),
                ),
              ))
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
