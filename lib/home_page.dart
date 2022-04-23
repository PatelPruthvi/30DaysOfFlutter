// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue App'),
        backgroundColor: Colors.deepPurple[600],
      ),
      drawer: Drawer(),
      body: Center(child: Text('Welcome to 30 days of Flutter...')),
    );
  }
}
