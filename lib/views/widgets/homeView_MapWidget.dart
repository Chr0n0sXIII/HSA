import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gm;
import 'dart:html';
import 'dart:ui' as ui;

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  bool active_Job = true;
  String job_Title = 'Placeholder job title';
  String jobDesc = 'Placeholder job description';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      width: 450,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(7.0, 8.0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 5, 0),
              child: active_Job == false
              ?Text(
                'No Current Job Taken',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
              :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      job_Title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    jobDesc,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis
                    ),
                  )
                ],
              )
            ),
          ),
          Expanded(
              flex: 1,
              child: active_Job == false
                  ? InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Looking For A Job',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const Icon(
                                Icons.search_outlined,
                                color: Colors.grey,
                                size: 36,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      child: GoogleMap(),
                    ))
        ],
      ),
    );
  }

  GoogleMap() {
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
        ..style.borderRadius = '30px';

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
