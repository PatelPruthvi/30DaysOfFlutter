// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
            child: Text(
          'Login Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
            fontSize: 12.0,
          ),
          textScaleFactor: 2.0,
        )),
      ),
    );
  }
}
