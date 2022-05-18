// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widgets/drawer.dart';
import 'package:codepur/widgets/item_widget.dart';
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
    await Future.delayed(Duration(milliseconds: 2500));
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
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'Catalogue App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                itemCount: CatalogModel.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: GridTile(
                      header: Container(
                          decoration: BoxDecoration(color: Colors.deepPurple),
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          )),
                      child: Image.network(
                        item.image,
                      ),
                      footer: Container(
                          decoration: BoxDecoration(color: Colors.black),
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
