// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:codepur/pages/home_page.dart';
import 'package:codepur/pages/login_page.dart';
import 'package:codepur/utils/routes.dart';
import 'package:codepur/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      theme: MyTheme.themeData,
      routes: {
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => Login()
      },
    );
  }
}
