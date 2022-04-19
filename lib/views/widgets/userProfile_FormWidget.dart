import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:io' show File;

import '../../dataClasses/User.dart';
import '../homeView.dart';

class ProfileForm extends StatefulWidget {
  final User user;
  const ProfileForm({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? username_Error;
  String? AboutMe_Error;
  String? TradeSkills_Error;
  String? contactInfo_Error;

  final nameController = TextEditingController();
  final aboutmeController = TextEditingController();
  final skillsController = TextEditingController();
  final contactController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? image = <XFile>[];
  List<XFile> ImageList = <XFile>[];
  List<String> imageURL_list = <String>[];
  bool imageLoaded = false;

  late String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Imange and Update Image Button
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(7.0, 8.0))
                          ]),
                      child: imageLoaded == false
                          ? Image.network(widget.user.pfp)
                          : Image.network(
                              imageURL_list[0],
                              fit: BoxFit.cover,
                            ))),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      getImageFromDevice();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Update Profile\nPicture',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
        ),
        // Username Row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(125, 13, 20, 0),
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(1.0, 1.0))
                ]),
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  maxLength: 20,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: username_Error,
                      hintText: widget.user.uName,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              )
            ],
          ),
        ),
        // About Me Row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(130, 11, 20, 0),
                child: Text(
                  'About Me',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(1.0, 1.0))
                ]),
                child: TextField(
                  controller: aboutmeController,
                  maxLines: 4,
                  maxLength: 250,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: widget.user.about,
                      errorText: AboutMe_Error,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              )
            ],
          ),
        ),
        // Trade Skills Row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 13, 20, 0),
                child: Text(
                  'Profession / Trade Skills',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(1.0, 1.0))
                ]),
                child: TextField(
                  controller: skillsController,
                  maxLines: 2,
                  maxLength: 80,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: TradeSkills_Error,
                      hintText: widget.user.skills,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              )
            ],
          ),
        ),
        // Contact No. Row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                // Text Box
                padding: EdgeInsets.fromLTRB(110, 13, 20, 0),
                child: Text(
                  'Contact No.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // Text Field
                width: 400,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(1.0, 1.0))
                ]),
                child: TextField(
                  controller: contactController,
                  maxLines: 1,
                  maxLength: 30,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: contactInfo_Error,
                      hintText: widget.user.contacts,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              )
            ],
          ),
        ),
        // Update Profile Button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(11, 206, 131, 1)),
              onPressed: () {
                update();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
        )
      ],
    );
  }

  void getImageFromDevice() async {
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
    imageLoaded = true;
  }

  void addImage() {
    for (var bytes in image!) {
      imageURL_list.add(File(bytes.path).path.toString());
    }
  }

  Future<void> update() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(widget.user.user_ID);
    if (nameController.text.isNotEmpty) {
      docUser.update({'Name': nameController.text});
      widget.user.setUname(nameController.text);
    }
    if (aboutmeController.text.isNotEmpty) {
      docUser.update({'About': aboutmeController.text});
      widget.user.setabout(aboutmeController.text);
    }
    if (skillsController.text.isNotEmpty) {
      docUser.update({'Skills': skillsController.text});
      widget.user.setskills(skillsController.text);
    }
    if (nameController.text.isNotEmpty) {
      docUser.update({'Contacts': contactController.text});
      widget.user.setcontacts(contactController.text);
    }
    if (imageLoaded == true) {
      await upload(widget.user.user_ID);
      widget.user.setpfp(value);
      docUser.update({'Profile_Picture': value});
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeView(
                  user: widget.user,
                )));
    }
  }

  upload(String jobID) async {
    String productId = await uploadImageAndSaveItemInfo(jobID);
  }

  Future<String> uploadImageAndSaveItemInfo(String userID) async {
    PickedFile? pickedFile;
    String? productId = userID;
    file = File(ImageList[0].path);
    pickedFile = PickedFile(file!.path);
    await uploadImageToStorage(pickedFile, productId);
    return productId;
  }

  uploadImageToStorage(PickedFile? pickedFile, String productId) async {
    String? pId = const Uuid().v4();
    Reference reference =
        FirebaseStorage.instance.ref().child('PFPs/$productId/$pId');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    value = await reference.getDownloadURL();
  }
}
