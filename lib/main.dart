import 'package:flutter/material.dart';
import 'loginpage1.dart';
import 'registrationpage1.dart';
import 'loginpage2.dart';
import 'registrationpage2.dart';
import 'gallery.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registration2(),
      routes: {
        '/gallery': (context) => Gallery(),
        '/login1': (context) => Login1(),
        '/registration1': (context) => Registration1(),
        '/login2': (context) => Login2(),
        '/registration2': (context) => Registration2()
      },
    );
  }
}
