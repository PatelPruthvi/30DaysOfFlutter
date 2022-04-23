// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:codepur/home_page.dart';
import 'package:codepur/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => HomePage(),
        '/login': (context) => Login()
      },
    );
  }
}
