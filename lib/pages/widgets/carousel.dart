import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tixtix/consts/data.dart';

final imageSliders = data.asMap().entries.map((entry) {
  return Builder(
    builder: (BuildContext context) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                    color: const Color.fromARGB(100, 0, 0, 0), width: 0.5)),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: GestureDetector(
                onTapUp: (details) {
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => DetailPage(movie: entry.value, index: entry.key,))
                  // );
                },
                child: Image.asset(entry.value['img'],
                    fit: BoxFit.fill, width: 800.0),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            entry.value['title'],
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          )
        ],
      );
    },
  );
}).toList();

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Carousel();
  }
}

class _Carousel extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                // enlargeCenterPage: true,
                scrollPhysics: const RangeMaintainingScrollPhysics(),
                aspectRatio: 0.5625,
                pageSnapping: false,
              ),
            ),
          ),
        ]);
  }
}
