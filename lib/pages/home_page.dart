// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:codepur/utils/routes.dart';
import 'package:codepur/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  bool changedButt = false;

  final _formKey = GlobalKey<FormState>();

  moveTonext(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButt = !changedButt;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalogue App',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username Cannot be empty ";
                        }
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot be empty ";
                        } else if (value.length < 6) {
                          return "Password length should atleast be 6";
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changedButt ? 20 : 8),
                      child: InkWell(
                        onTap: () async {
                          moveTonext(context);
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
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
