// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  final Item Catalogue;

  const HomeDetail({Key? key, required this.Catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text('\$${Catalogue.price.toString()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Theme.of(context).buttonColor)),
            AddToCart(catalog: Catalogue)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(children: [
        Hero(
            tag: Key(Catalogue.id.toString()),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                Catalogue.image,
                height: 300,
              ),
            )),
        Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        Catalogue.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Theme.of(context).accentColor),
                      ),
                    )),
                    Text(Catalogue.desc,
                        style:
                            TextStyle(fontSize: 20, color: Colors.grey[600])),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          'Ipsum kasd diam tempor justo accusam gubergren, invidunt ea sit sanctus justo ut. Accusam at eos takimata sadipscing et elitr amet ipsum, et aliquyam erat clita magna ipsum lorem. Duo at no sit justo labore gubergren invidunt. Ea voluptua et.',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ),
                  ],
                )))
      ]),
    );
  }
}
