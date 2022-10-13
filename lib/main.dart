import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const App());
}

final Widget svg = SvgPicture.asset('assets/images/flutter_logo.svg');
final Widget networkSvg = SvgPicture.network(
    'https://cdn.worldvectorlogo.com/logos/iaf-1-search-and-rescue.svg');

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final widgetList = [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/I_Love_New_York.svg/800px-I_Love_New_York.svg.png',
      'https://s.yimg.com/cv/apiv2/default/mlb/20190319/500x500/yankees_wbgs.png',
    ];

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
