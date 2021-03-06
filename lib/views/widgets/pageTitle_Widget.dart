import 'package:flutter/material.dart';

class PageTitle extends StatefulWidget {
  final String title;
  const PageTitle(this.title, {Key? key}) : super(key: key);

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 25, 250, 25),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(195, 166, 96, 1),
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
