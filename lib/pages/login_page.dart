// ignore_for_file: prefer_const_constructors

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widgets/drawer.dart';
import 'package:codepur/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final DummyList = List.generate(20, (index) => CatalogModel.items[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'Catalogue App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: DummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: DummyList[index],
            );
          },
        ),
      ),
    );
  }
}
