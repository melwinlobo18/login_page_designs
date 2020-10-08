import 'package:flutter/material.dart';
import 'package:sample_designs/gallery.dart';
import 'package:sample_designs/login_page_1/loginpage1.dart';
import 'package:sample_designs/login_page_1/registrationpage1.dart';
import 'package:sample_designs/login_page_2/loginpage2.dart';
import 'package:sample_designs/login_page_2/registrationpage2.dart';
import 'package:sample_designs/login_page_3/loginpage3.dart';
import 'package:sample_designs/login_page_3/registrationpage3.dart';
import 'package:sample_designs/login_page_4/loginpage4.dart';
import 'package:sample_designs/login_page_4/registrationpage4.dart';
import 'package:sample_designs/login_page_5/loginpage5.dart';
import 'package:sample_designs/login_page_5/registrationpage5.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: Gallery(),
      routes: {
        '/gallery': (context) => Gallery(),
        '/login1': (context) => Login1(),
        '/registration1': (context) => Registration1(),
        '/login2': (context) => Login2(),
        '/registration2': (context) => Registration2(),
        '/login3': (context) => Login3(),
        '/registration3': (context) => Registration3(),
        '/login4': (context) => Login4(),
        '/registration4': (context) => Registration4(),
        '/login5': (context) => Login5(),
        '/registration5': (context) => Registration5(),
      },
    );
  }
}
