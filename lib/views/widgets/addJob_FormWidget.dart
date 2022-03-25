import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                child: TextField(
                  maxLength: 40,
                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      label: Text("Job Title"),
                      errorText: Job_Title_Error,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
              Container(
                width: 400,
                child: TextField(
                  maxLength: 250,
                  maxLines: 4,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      label: Text("Job Description"),
                      errorText: Job_Title_Error,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
              DropdownButton<String>(
                value: selectedItem,
                items: items.map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item))).toList(),
                onChanged: (item) => 
                setState(() {
                  selectedItem = item;
                  }
                )
              ),
              Container(
                width: 200,
                child: TextField(
                  maxLength: 10,
                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      label: Text("Price"),
                      errorText: Job_Title_Error,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
