import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Worker_Review_Fo extends StatefulWidget {
  const Worker_Review_Fo({Key? key}) : super(key: key);

  @override
  State<Worker_Review_Fo> createState() => _Worker_Review_FoState();
}

class _Worker_Review_FoState extends State<Worker_Review_Fo> {
  final controller = CarouselController();
  bool imagesLoaded = false;
  List<String> imageURL_list = <String>[];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(196, 196, 196, 1)),
                child: imagesLoaded == false
                    ? Center(child: CircularProgressIndicator())
                    : CarouselSlider.builder(
                        carouselController: controller,
                        itemCount: imageURL_list.length,
                        itemBuilder: (context, index, realIndex) {
                          final imageURL = imageURL_list[index];
                          return buildImage(imageURL, index);
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index),
                        ))),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Color.fromRGBO(4, 30, 81, 1)),
                      onPressed: back,
                      child: Icon(Icons.arrow_back)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Color.fromRGBO(4, 30, 81, 1)),
                      onPressed: next,
                      child: Icon(Icons.arrow_forward))
                ],
              ),
            )
          ],
        ),
        Column(),
      ],
    );
  }

  back() {
    if (imagesLoaded == true) {
      controller.previousPage();
    }
  }

  next() {
    if (imagesLoaded == true) {
      controller.nextPage();
    }
  }

  Widget buildImage(String imageURL, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
