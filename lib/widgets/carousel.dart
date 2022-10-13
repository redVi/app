// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

final Widget svg = SvgPicture.asset('assets/images/flutter_logo.svg');
final Widget networkSvg = SvgPicture.network(
    'https://cdn.worldvectorlogo.com/logos/iaf-1-search-and-rescue.svg');
final widgetList = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/I_Love_New_York.svg/800px-I_Love_New_York.svg.png',
  'https://s.yimg.com/cv/apiv2/default/mlb/20190319/500x500/yankees_wbgs.png',
];

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Row(children: [svg, networkSvg]),
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3)),
            items: widgetList
                .map((item) => Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 500)))
                .toList(),
          ),
        ]));
  }
}
