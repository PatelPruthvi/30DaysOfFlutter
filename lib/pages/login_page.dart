// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widgets/drawer.dart';
import 'package:codepur/widgets/item_widget.dart';
import 'package:codepur/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
                Expanded(child: CatalogList())
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          'Catalog App',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBlue),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Trending Products ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyTheme.darkBlue),
          ),
        )
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(Catalogue: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalogue;

  const CatalogItem({Key? key, required this.Catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: 300,
      height: 140,
      // ignore: prefer_const_literals_to_create_immutables
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          CatalogImage(img: Catalogue.image),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(Catalogue.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: MyTheme.darkBlue)),
              ),
              Text(Catalogue.desc,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700])),
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 0),
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('\$${Catalogue.price.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: MyTheme.darkBlue)),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkBlue)),
                      onPressed: () {},
                      label: Text('Buy'),
                      icon: Icon(CupertinoIcons.cart_badge_plus),
                    )
                  ],
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String img;

  const CatalogImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: 120,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Image.network(img)),
    );
  }
}
