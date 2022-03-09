import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  String email = "";
  String password = "";
  final emailController = TextEditingController();
  final passController = TextEditingController();
  LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email = "";
  String password = "";
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
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
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
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
                  child: Text("Login"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(4, 30, 81, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black))))),
            ),
          ),
        ],
      ),
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
