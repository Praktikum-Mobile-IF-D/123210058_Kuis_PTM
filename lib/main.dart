import 'package:flutter/material.dart';
import 'package:ifd_kuis_nanang/pages/login.dart';
import 'package:ifd_kuis_nanang/pages/home.dart';
import 'package:ifd_kuis_nanang/pages/detail.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KUIS IF-D',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}

