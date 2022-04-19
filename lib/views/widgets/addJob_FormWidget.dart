import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/views/homeView.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlng/latlng.dart';
import 'dart:io' show File;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uuid/uuid.dart';
import '../../dataClasses/User.dart';

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
    'Maintenance',
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
  List<String> imageRefs = <String>[];
  bool imageUploaded = false;

  int activeIndex = 0;

  final job_Title_controller = TextEditingController();
  final job_Description_controller = TextEditingController();
  final job_Price_controller = TextEditingController();

  String Address = "";

  bool uploading = false;

  late Position pos;

  late LatLng latlng;

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
                      onPressed: getlocation,
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
    print('[Add Images] : Start');
    if (image != null) {
      setState(() {
        ImageList = ImageList + image!;
        addImage();
        image!.clear();
      });
    }
    imageUploaded = true;
    print('[Image URL List ] : ' + imageURL_list.toString());
    print('[ADD Images] : Finsh');
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
                      Text(Address)
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
                          onPressed: () {
                            confirm();
                          },
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

  Future<void> getlocation() async {
    pos = await _getGeoLocationPosition();
    print(pos);
    latlng = LatLng(pos.latitude, pos.longitude);
    getAddressFromLatLng(pos);
  }

  Future confirm() async {
    Navigator.of(context).pop();
    renderLoadingView();
    final docJob = FirebaseFirestore.instance.collection('jobs').doc();
    await upload(docJob.id);
    final job = JobData(
        jobID: docJob.id,
        jobName: job_Title_controller.text,
        jobDescription: job_Description_controller.text,
        jobLocation: Address,
        jobType: selectedItem,
        jobPrice: job_Price_controller.text,
        Latitude: pos.latitude,
        Longitude: pos.longitude,
        CompletedJobImages: [],
        ActiveJobImages: imageRefs,
        clientReview: '',
        workerReview: '',
        job_Requests: []
        );
    final jsonData = job.toJson();
    await docJob.set(jsonData);
    widget.user.addJob(docJob.id);
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(widget.user.user_ID);
    print('[Updated User]' + widget.user.toString());
    print('[New Job Added]' + job.toString());
    docUser.update({'Active_Jobs': widget.user.activeJobs});
    Navigator.of(context).pop();
    showToast('Upload Successful! Job Added to Listing');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeView(
                  user: widget.user,
                )));
  }

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

  getAddressFromLatLng(Position pos) async {
    try {
      GeoCode geoCode = GeoCode();
      var address = await geoCode.reverseGeocoding(
          latitude: pos.latitude, longitude: pos.longitude);

      setState(() {
        Address =
            "${address.city}"; //here you can used place.country and other things also
        print(Address);
      });
    } catch (e) {
      print(e);
    }
  }

  upload(String jobID) async {
    String productId = await uploadImageAndSaveItemInfo(jobID);
    setState(() {
      uploading = false;
    });
  }

  Future<String> uploadImageAndSaveItemInfo(String jobID) async {
    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    String? productId = jobID;
    for (int i = 0; i < ImageList.length; i++) {
      file = File(ImageList[i].path);
      pickedFile = PickedFile(file!.path);
      await uploadImageToStorage(pickedFile, productId);
    }
    return productId;
  }

  uploadImageToStorage(PickedFile? pickedFile, String productId) async {
    String? pId = const Uuid().v4();
    Reference reference =
        FirebaseStorage.instance.ref().child('Jobs/$productId/$pId');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    String value = await reference.getDownloadURL();
    imageRefs.add(value);
    print(value);
  }

  Future renderLoadingView() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40)),
              title: Text(
                'Uploading Data...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              content: Container(
                height: 200,
                width: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ));
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, webPosition: 'center', timeInSecForIosWeb: 4);
  }
}
