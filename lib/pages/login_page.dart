// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widgets/home_widgets/CatalogHeader.dart';
import 'package:codepur/widgets/home_widgets/Catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(Duration(milliseconds: 1800));
    final CataJson = await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(CataJson);
    var productData = decodedData['products'];

    CatalogModel.items =
        List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Catalogheader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CatalogList(),
                ))
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
