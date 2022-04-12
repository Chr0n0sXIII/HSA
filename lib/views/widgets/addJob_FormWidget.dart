import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:latlng/latlng.dart';
<<<<<<< HEAD
import 'dart:io';
import 'dart:io' show File;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uuid/uuid.dart';
=======
import 'dart:io' show File;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uuid/uuid.dart';

import '../../dataClasses/User.dart';
>>>>>>> origin/Jiles

class Add_Job_Form extends StatefulWidget {
  final User user;
  const Add_Job_Form({Key? key, required this.user}) : super(key: key);

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
  final staticImage = 'https://static.thenounproject.com/png/3322766-200.png';
  final controller = CarouselController();

  List<Widget> PhotoWidgetList = <Widget>[];
  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? image = <XFile>[];
  List<XFile> ImageList = <XFile>[];
  List<String> imageURL_list = <String>[];
  bool imageUploaded = false;

  int activeIndex = 0;

  final job_Title_controller = TextEditingController();
  final job_Description_controller = TextEditingController();
  final job_Price_controller = TextEditingController();

<<<<<<< HEAD
=======
  String Address = "";

>>>>>>> origin/Jiles
  @override
  void dispose() {
    job_Description_controller.dispose();
    job_Price_controller.dispose();
    job_Title_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(250, 25, 250, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 400,
                      child: imageUploaded == false
                          ? InkWell(
                              onTap: pickImagesFromDevice,
                              hoverColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromRGBO(196, 196, 196, 1)),
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                height: 500,
                                child: Image(
                                  image: NetworkImage(staticImage),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                InkWell(
                                  onTap: pickImagesFromDevice,
                                  hoverColor: Colors.transparent,
                                  child: CarouselSlider.builder(
                                    carouselController: controller,
                                    itemCount: imageURL_list.length,
                                    itemBuilder: (context, index, realIndex) {
                                      final imageURL = imageURL_list[index];
                                      return buildImage(imageURL, index);
                                    },
                                    options: CarouselOptions(
                                      height: 500,
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      enableInfiniteScroll: false,
                                      onPageChanged: (index, reason) =>
                                          setState(() => activeIndex = index),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(15),
                                              primary:
                                                  Color.fromRGBO(4, 30, 81, 1)),
                                          onPressed: back,
                                          child: Icon(Icons.arrow_back)),
                                      buildImageIndicator(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(15),
                                              primary:
                                                  Color.fromRGBO(4, 30, 81, 1)),
                                          onPressed: next,
                                          child: Icon(Icons.arrow_forward))
                                    ],
                                  ),
                                )
                              ],
                            )),
                ),
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
                      controller: job_Title_controller,
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
                      controller: job_Description_controller,
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
                      controller: job_Price_controller,
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
                      onPressed: () {
                        openConfirmPopUp();
                      },
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
      ),
    );
  }

  Widget buildImage(String urlimage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          urlimage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  pickImagesFromDevice() async {
    image = await _picker.pickMultiImage();
    imageURL_list.clear();
    ImageList.clear();
    if (image != null) {
      setState(() {
        ImageList = ImageList + image!;
        addImage();
        image!.clear();
      });
    }
    imageUploaded = true;
  }

  void addImage() {
    for (var bytes in image!) {
      imageURL_list.add(File(bytes.path).path.toString());
    }
  }

  buildImageIndicator() {
    return AnimatedSmoothIndicator(
      onDotClicked: moveToImage,
      activeIndex: activeIndex,
      count: imageURL_list.length,
      effect:
          ScrollingDotsEffect(activeDotColor: Color.fromRGBO(195, 166, 96, 1)),
    );
  }

  void back() {
    controller.previousPage();
  }

  void next() {
    controller.nextPage();
  }

  moveToImage(int index) {
    controller.animateToPage(index);
  }

  Future openConfirmPopUp() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40)),
              title: Text(
                'Confirm Your Listing',
                textAlign: TextAlign.center,
              ),
              content: Container(
                width: 400,
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Job Title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(job_Title_controller.text),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(job_Description_controller.text),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(selectedItem!),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(job_Price_controller.text),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Job Location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text('placeholder')
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              primary: Color.fromRGBO(244, 67, 54, 1)),
                          onPressed: cancel,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              primary: Color.fromRGBO(11, 206, 131, 1)),
                          onPressed: confirm,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ));
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void confirm() async {
    String jobID = UuidValue(job_Title_controller.text).uuid;
    Position pos = await _getGeoLocationPosition();
    LatLng latLng = LatLng(pos.latitude, pos.longitude);

    JobData job = JobData(
        jobID: jobID,
        jobName: job_Title_controller.text,
        jobDescription: job_Description_controller.text,
        jobLocation: Address,
        jobType: selectedItem.toString(),
        latLng: latLng,
        jobPrice: job_Price_controller.text,
        JobImages: imageURL_list);
    widget.user.activeRequests.add(jobID);
    FirebaseFirestore.instance.collection("openjobs").add(job.toMap());
    final val = await FirebaseFirestore.instance
        .collection("users")
        .where("uName", isEqualTo: widget.user.uName)
        .get();

    for (var doc in val.docs) {
      doc.data().update("activeRequests",((value) => widget.user.activeRequests) );
    }
  }

  /*getLocation() async {
    Position pos;
    if (await Geolocator.isLocationServiceEnabled()) {
      pos = await Geolocator.getCurrentPosition();
    } else {
      await Geolocator.requestPermission();
      return getLocation();
    }
    return LatLng(pos.latitude, pos.longitude);
  }*/
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      Address = ' ${place.locality}';
    });
  }
}
