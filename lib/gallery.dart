import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            cards(
                context: context,
                imgPath: 'images/Login1.jpeg',
                onTap: () {
                  Navigator.pushNamed(context, '/login1');
                }),
            cards(
                context: context,
                imgPath: 'images/Login2.jpeg',
                onTap: () {
                  Navigator.pushNamed(context, '/login2');
                }),
            cards(
                context: context,
                imgPath: 'images/Login3.jpeg',
                onTap: () {
                  Navigator.pushNamed(context, '/login3');
                })
          ],
        ),
      ),
    );
  }

  Center cards({BuildContext context, String imgPath, Function onTap}) {
    return Center(
      child: Container(
        height: 450,
        width: 300,
        child: GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(imgPath, fit: BoxFit.cover),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
