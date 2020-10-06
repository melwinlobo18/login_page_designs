import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class _PageSelector extends StatefulWidget {
  const _PageSelector({this.cards});

  final List<Card> cards;

  @override
  __PageSelectorState createState() => __PageSelectorState();
}

class __PageSelectorState extends State<_PageSelector> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Center(
      child: CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            height: height * 0.65,
            initialPage: 1,
            scrollPhysics: BouncingScrollPhysics()
            // autoPlay: true,
            ),
        items: widget.cards.map<Widget>((Card cards) {
          return cards;
        }).toList(),
      ),
    ));
  }
}

class Gallery extends StatelessWidget {
  static const String routeName = '/material/page-selector';

  List cardList(BuildContext context) {
    final List<Card> cards = <Card>[
      CarouselCard(imgPath: 'assets/images/Login1.jpeg', path: '/login1')
          .build(context),
      CarouselCard(imgPath: 'assets/images/Login2.png', path: '/login2')
          .build(context),
      CarouselCard(imgPath: 'assets/images/Login3.jpeg', path: '/login3')
          .build(context),
      CarouselCard(imgPath: 'assets/images/Login4.png', path: '/login4')
          .build(context)
    ];
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: cardList(context).length,
        child: _PageSelector(cards: cardList(context)),
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  final String imgPath;
  final String path;
  CarouselCard({this.imgPath, this.path});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, path);
        },
        child: Container(
          // width: 400,
          // height: 450,
          child: Image.asset(imgPath, fit: BoxFit.fill),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
