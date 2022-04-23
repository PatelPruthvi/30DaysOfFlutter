// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue App'),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image.asset(
            "assets/images/unDraw_login.png",
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            'Welcome',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'example@charusat.edu.in',
                      labelText: 'E-MAIL',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'PASSWORD',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60))),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('SIGN-IN'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
