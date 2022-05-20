// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get themeData => ThemeData(
        cardColor: Colors.white,
        canvasColor: Colors.grey[200],
        buttonColor: MyTheme.darkBlue,
        accentColor: MyTheme.darkBlue,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[200],
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            )),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: Colors.grey[900],
        buttonColor: Colors.deepPurpleAccent,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[900],
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            )),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
  static Color creamColour = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403b58);

  static of(BuildContext context) {}
}
