import 'package:flutter/material.dart';
import 'package:http/browser_client.dart';

class jobListing_SearchWidget extends StatefulWidget {
  jobListing_SearchWidgetState createState() => jobListing_SearchWidgetState();
}

class jobListing_SearchWidgetState extends State<jobListing_SearchWidget> {
  String? selectedItem = "Job Type";
  List<String> items = [
    'Job Type',
    'Yark Work',
    'Cleaning',
    'Landscaping',
    'Painting',
    'Maintainace',
    'Plumbing',
    'Misc',
  ];

  String Distance_selectedItem = "Distance";
  List<String> Distance_items = [
    'Distance',
    '1Km - 5Km',
    '6Km - 10Km',
    '11Km - 15km',
    '16Km - 20Km',
  ];

  String Price_selectedItem = "Price";
  List<String> Price_items = [
    'Price',
    '\$50 - \$100',
    '\$110 - \$200',
    '\$210 - \$500',
    '\$500+',
  ];
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width.clamp(700, 1000),
                child: TextField(
                  obscureText: false,
                  enableSuggestions: true,
                  autocorrect: false,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  decoration: new InputDecoration.collapsed(
                    hintText: " Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                  ),
                  controller: searchController,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topCenter,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isDense: false,
                            value: selectedItem,
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                                    value: item, child: Text(item)))
                                .toList(),
                            onChanged: (item) => setState(() {
                                  selectedItem = item;
                                })),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isDense: false,
                            value: Distance_selectedItem,
                            items: Distance_items.map((String item) =>
                                DropdownMenuItem<String>(
                                    value: item, child: Text(item))).toList(),
                            onChanged: (item) => setState(() {
                                  Distance_selectedItem = item!;
                                })),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isDense: false,
                            value: Price_selectedItem,
                            items: Price_items.map((String item) =>
                                DropdownMenuItem<String>(
                                    value: item, child: Text(item))).toList(),
                            onChanged: (item) => setState(() {
                                  Price_selectedItem = item!;
                                })),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  search() {}
}
