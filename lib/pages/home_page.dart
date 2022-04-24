// ignore_for_file: prefer_const_constructors

import 'package:codepur/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  bool changedButt = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue App'),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(
              "assets/images/unDraw_login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome $name',
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
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
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changedButt = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.loginRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changedButt ? 50 : 150,
                      height: 40,
                      child: Center(
                          child: changedButt
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  'Log-In',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(changedButt ? 50 : 8),
                        color: Colors.deepPurple,
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
                  //   },
                  //   child: Text(
                  //     'SIGN-IN',
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  //   ),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
