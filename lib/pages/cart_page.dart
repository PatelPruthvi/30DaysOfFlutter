// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
