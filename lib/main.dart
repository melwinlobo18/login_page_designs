import 'package:flutter/material.dart';
import 'loginpage1.dart';
import 'registrationpage1.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login1(),
      routes: {
        '/login1': (context) => Login1(),
        '/registration1': (context) => Registration1(),
      },
    );
  }
}
