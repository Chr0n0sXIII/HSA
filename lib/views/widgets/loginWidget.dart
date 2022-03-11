import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  String email = "";
  String password = "";
  String Fname = "";
  String Lname = "";
  String conPass = "";

  LoginWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email = "";
  String password = "";
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
                height: 51,
                width: 112,
                child: ElevatedButton(
                    onPressed: null,
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
                    onPressed: null,
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
                    controller: passController,
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
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  getTextInputData() {
    setState(() {
      email = emailController.text;
      password = passController.text;
    });
  }
}

class _SignupWidgetState extends State<LoginWidget> {
  String email = "";
  String password = "";
  String Fname = "";
  String Lname = "";
  String conPass = "";
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final conpassController = TextEditingController();

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
                height: 51,
                width: 112,
                child: ElevatedButton(
                    onPressed: null,
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
                    onPressed: null,
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
                    style: TextStyle(fontSize: 30),
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
                    obscureText: false,
                    enableSuggestions: true,
                    autocorrect: false,
                    style: TextStyle(fontSize: 30),
                    decoration: new InputDecoration.collapsed(hintText: ""),
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
    // TODO: implement build
    throw UnimplementedError();
  }

  getTextInputData() {
    setState(() {
      email = emailController.text;
      password = passController.text;
    });
  }
}
