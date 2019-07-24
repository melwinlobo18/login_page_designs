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
            Center(
              child: Container(
                height: 450,
                width: 300,
                child: GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset('images/Login1.jpeg', fit: BoxFit.cover),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login1');
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                height: 450,
                width: 300,
                child: GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset('images/Login2.jpeg', fit: BoxFit.cover),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login2');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
