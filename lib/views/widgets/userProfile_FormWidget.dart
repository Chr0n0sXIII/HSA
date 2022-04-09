import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:io' show File;

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? username_Error;
  String currentUser_Username = "demo_Username";
  String? AboutMe_Error;
  String currentUser_AboutMe = "demo_AboutMe";
  String? TradeSkills_Error;
  String currentUser_TradeSkils = "demo_TradeSkills";
  String? contactInfo_Error;
  String currentUser_Contact = "demo_Contact";

  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? image = <XFile>[];
  List<XFile> ImageList = <XFile>[];
  List<String> imageURL_list = <String>[];
  bool imageLoaded = false;
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
                          ? Image.asset("profile_picture_place_holder.png")
                          : Image.network(imageURL_list[0]))),
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
                  maxLines: 1,
                  maxLength: 20,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: username_Error,
                      hintText: currentUser_Username,
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
                  maxLines: 4,
                  maxLength: 250,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: currentUser_AboutMe,
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
                  maxLines: 2,
                  maxLength: 80,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: TradeSkills_Error,
                      hintText: currentUser_TradeSkils,
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
                  maxLines: 1,
                  maxLength: 30,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: contactInfo_Error,
                      hintText: currentUser_Contact,
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
              onPressed: () {},
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
}
