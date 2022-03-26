import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jobDetails_ImageWidget extends StatefulWidget {
  List<Image>? image;
  int index = 0;

  jobDetails_ImageWidget({
    required this.image,
  });

  @override
  jobDetails_ImageWidget_state createState() => jobDetails_ImageWidget_state();
}

class jobDetails_ImageWidget_state extends State<jobDetails_ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 550,
          child: widget.image![widget.index],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _onpressedleft,
              child: Icon(
                Icons.arrow_left_sharp,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: _onpressedright,
              child: Icon(
                Icons.arrow_right_sharp,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }

  _onpressedleft() {
    widget.index--;
    if (widget.index == -1) {
      widget.index = widget.image!.length;
      widget.createState();
    }
  }

  _onpressedright() {
    widget.index++;
    if (widget.index >= widget.image!.length) {
      widget.index = 0;
    }
  }
}
