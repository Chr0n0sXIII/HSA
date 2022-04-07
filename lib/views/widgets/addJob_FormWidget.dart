import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:io' show File;

class Add_Job_Form extends StatefulWidget {
  const Add_Job_Form({Key? key}) : super(key: key);

  @override
  State<Add_Job_Form> createState() => _Add_Job_FormState();
}

class _Add_Job_FormState extends State<Add_Job_Form> {
  String? Job_Title_Error;
  List<String> items = [
    'Yark Work',
    'Cleaning',
    'Landscaping',
    'Painting',
    'Maintainace',
    'Plumbing',
    'Misc'
  ];
  String? selectedItem = "Plumbing";
  final staticImage = ['https://static.thenounproject.com/png/3322766-200.png'];

  List<Widget> PhotoWidgetList = <Widget>[];
  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? image = <XFile>[];
  List<XFile> ImageList = <XFile>[];
  List<String> imageURL = <String>[];
  bool imageUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  width: 400,
                  child: CarouselSlider.builder(
                    itemCount: staticImage.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlimage = staticImage[index];
                      return buildImage(urlimage, index);
                    },
                    options: CarouselOptions(height: 500, autoPlay: true),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue[900]),
                    onPressed: () async {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Upload Images',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  child: TextField(
                    maxLength: 40,
                    maxLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text("Job Title..."),
                        errorText: Job_Title_Error,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  child: TextField(
                    maxLength: 250,
                    maxLines: 4,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text("Job Description..."),
                        errorText: Job_Title_Error,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                    value: selectedItem,
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (item) => setState(() {
                          selectedItem = item;
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: TextField(
                    maxLength: 10,
                    maxLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text("Price..."),
                        errorText: Job_Title_Error,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Request Location',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(11, 206, 131, 1)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlimage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        urlimage,
        fit: BoxFit.fill,
      ),
    );
  }
}
