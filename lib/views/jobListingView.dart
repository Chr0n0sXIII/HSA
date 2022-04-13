import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/pageTitle_Widget.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as gm;

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
            flex: 6,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
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
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
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
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
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
                ),
              ))
        ],
      ),
    );
  }

  jobListingMapView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 10, 250, 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(15)
        ),
        height: 600,
        width: 600,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: googleMaps(),
              ),
            )
          ],
        ),
      ),
    );
  }

  jobList() {
    return Container();
  }

  googleMaps() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = gm.LatLng(10.640821, -61.398547);

      final mapOptions = gm.MapOptions()
        ..zoom = 13
        ..center = gm.LatLng(10.640821, -61.398547);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none'
        ..style.borderRadius = '13px';

      final map = gm.GMap(elem, mapOptions);

      gm.Marker(gm.MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Active Job Location');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
