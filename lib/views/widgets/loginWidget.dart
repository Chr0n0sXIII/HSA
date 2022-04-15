import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/userCredentials.dart';
import 'package:home_service_app/dataClasses/userCredentialsUtil.dart';
import 'package:home_service_app/dataClasses/userData.dart';
import 'package:home_service_app/views/homeView.dart';
import "package:home_service_app/dataClasses/User.dart";

class LoginWidget extends StatefulWidget {
  String email = "";
  String password = "";
  String Fname = "";
  String Lname = "";
  String conPass = "";

  List<userCredentials> testData =
      userCredentialUtil.TestData_UserCredentials();

  LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final conpassController = TextEditingController();
  bool isLogin = true;
  bool wrongcred = false;
  bool validated = false;
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 15.0),
              //padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                key: Key("switch login"),
                height: 51,
                width: 112,
                child: ElevatedButton(
                    onPressed: setlogin,
                    child: Text(
                      "Login",
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(4, 30, 81, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    side: BorderSide(color: Colors.black))))),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 15.0),
              //padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 51,
                width: 112,
                child: ElevatedButton(
                    key: Key("switch signup"),
                    onPressed: setSignup,
                    child: Text(
                      "Signup",
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(195, 166, 96, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    side: BorderSide(color: Colors.white))))),
              ),
            ),
          ],
        ),
        if (isLogin)
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromRGBO(229, 229, 229, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: false,
                      enableSuggestions: true,
                      autocorrect: false,
                      style: TextStyle(fontSize: 30),
                      decoration: new InputDecoration.collapsed(hintText: ""),
                      controller: emailController,
                    ),
                  ),
                  Text(
                    "Password",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(fontSize: 30),
                      decoration: new InputDecoration.collapsed(hintText: ""),
                      onSubmitted: (String value) {
                        getTextInputData();
                      },
                      controller: passController,
                    ),
                  ),
                  if (wrongcred)
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        height: 25,
                        child: Text(
                          "Wrong Email or Password",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 55,
                      width: 348,
                      child: ElevatedButton(
                          key: Key("login lutton"),
                          onPressed: getTextInputData,
                          child: Text(
                            "Login",
                            style: const TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(195, 166, 96, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black))))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (!isLogin)
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromRGBO(229, 229, 229, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: false,
                      enableSuggestions: true,
                      autocorrect: false,
                      style: TextStyle(fontSize: 30),
                      decoration: new InputDecoration.collapsed(hintText: ""),
                      controller: emailController,
                    ),
                  ),
                  Text(
                    "First Name",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: false,
                      enableSuggestions: true,
                      autocorrect: false,
                      style: TextStyle(fontSize: 30),
                      decoration: new InputDecoration.collapsed(hintText: ""),
                      controller: fnameController,
                    ),
                  ),
                  Text(
                    "Last Name",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: false,
                      enableSuggestions: true,
                      autocorrect: false,
                      style: TextStyle(fontSize: 30),
                      decoration: new InputDecoration.collapsed(hintText: ""),
                      controller: lnameController,
                    ),
                  ),
                  Text(
                    "Password",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(fontSize: 25),
                      decoration: new InputDecoration.collapsed(hintText: ""),
                      controller: passController,
                    ),
                  ),
                  Text(
                    "Confirm Password",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(fontSize: 30),
                      decoration: InputDecoration(
                          hintText: "",
                          errorText: _validateSamePass(),
                          errorStyle: TextStyle(color: Colors.red)),
                      controller: conpassController,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 55,
                      width: 348,
                      child: ElevatedButton(
                        key: Key("signup button"),
                          onPressed: getTextInputData,
                          child: Text(
                            "Signup",
                            style: const TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(195, 166, 96, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black))))),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  getTextInputData() async {
    User user = User(
        uName: 'uName',
        email: 'email',
        about: 'about',
        contacts: 'contacts',
        skills: 'skills',
        activeRequests: ['activeRequests'],
        completedRequests: ['completedRequests'],
        activeJob: 'activeJob',
        completedJobs: ['completedjobs'],
        clientRating: 0,
        workerRating: 0,
        pfp: 'pfp',
        pfpImage: Image.asset("assets/profile_picture_place_holder.png"));
    await authCredentials();
    if (validated) {
      user = await loadUserProfile();
    }
    setState(() {
      widget.email = emailController.text;
      widget.password = passController.text;
      widget.Fname = fnameController.text;
      widget.Lname = lnameController.text;
      widget.conPass = conpassController.text;
      if (isLogin) {
        print(validated);
        if (validated) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeView(
                        user: user,
                      )));
        } else {
          setState(() {
            wrongcred = true;
          });
        }
      } else {
        if (_validateSamePass() == null) {
          submitUser();
          submitCredentials();
          setState(() {
            isLogin = true;
          });
        }
      }
    });
  }

  setlogin() {
    setState(() {
      isLogin = true;
      passController.dispose();
      emailController.dispose();
      conpassController.dispose();
      fnameController.dispose();
      lnameController.dispose();
    });
  }

  setSignup() {
    setState(() {
      isLogin = false;
      widget.email = "";
      widget.password = "";
      widget.Fname = "";
      widget.Lname = "";
      widget.conPass = "";
    });
  }

  _validateSamePass() {
    if (conpassController.text != passController.text) {
      return "Passwords don't match";
    }
    return null;
  }

  Future<bool> authCredentials() async {
    final value = await FirebaseFirestore.instance
        .collection("credentials")
        .where('uName', isEqualTo: emailController.text)
        .get();
    for (var doc in value.docs) {
      String val = doc.get('Password');
      //print(val.toString());
      // print(passController.text);
      print((passController.text.compareTo(val.toString())));
      if (passController.text.compareTo(val.toString()) == 0) {
        setState(() {
          validated = true;
        });
        return true;
      } else {
        setState(() {
          validated = false;
        });
      }
    }
    return false;
  }

  submitUser() {
    var udata = userData(
            uName: fnameController.text + " " + lnameController.text,
            email: emailController.text,
            about: "n/a",
            contacts: "na",
            skills: "na",
            activeJob: "3",
            activeRequests: ["1", "2"],
            clientRating: "0",
            workerRating: "0",
            pfp:
                "https://firebasestorage.googleapis.com/v0/b/homeserviceapp-a9232.appspot.com/o/shrekpfp.jpg?alt=media&token=174f1566-8caf-4969-8b66-a11b0b680027")
        .toMap();
    FirebaseFirestore.instance.collection("users").add(udata);
  }

  submitCredentials() {
    var cred = userCredentials(
            uName: emailController.text, Password: passController.text)
        .toMap();

    FirebaseFirestore.instance.collection("credentials").add(cred);
  }

  loadUserProfile() async {
    final value = await FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: emailController.text)
        .get();
    for (var doc in value.docs) {
      Reference ref = FirebaseStorage.instance.ref().child(doc.get("pfp"));
// no need of the file extension, the name will do fine.
      var url = await ref.getDownloadURL();
      List a = doc.get("activeRequests");
      List<String> activeRequest = [];
      List<String> completedRequests = [];
      List<String> completedJobs = [];

      for (String s in a) {
        activeRequest.add(s);
      }
      a = doc.get("completedRequests");
      for (String s in a) {
        completedRequests.add(s);
      }
      a = doc.get("completedJobs");
      for (String s in a) {
        completedJobs.add(s);
      }
      print(activeRequest.toString());
      final User user = User(
        uName: doc.get("uName"),
        email: doc.get("email"),
        about: doc.get("about"),
        contacts: doc.get("contacts"),
        skills: doc.get("skills"),
        activeRequests: activeRequest,
        completedRequests: completedRequests,
        activeJob: doc.get("activeJob"),
        completedJobs: completedJobs,
        clientRating: doc.get("clientRating"),
        workerRating: doc.get("workerRating"),
        pfp: doc.get("pfp"),
        pfpImage: Image.network(url),
      );
      print("here");

      return user;
    }
  }
}
