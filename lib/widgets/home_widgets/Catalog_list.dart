// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:codepur/models/catalog.dart';
import 'package:codepur/pages/home_detail.dart';
import 'package:codepur/widgets/home_widgets/Catalog_image.dart';
import 'package:codepur/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetail(Catalog: catalog))),
            child: CatalogItem(Catalogue: catalog));
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
      color: Theme.of(context).canvasColor,
      width: 300,
      height: 140,
      // ignore: prefer_const_literals_to_create_immutables
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Hero(
              tag: Key(Catalogue.id.toString()),
              child: CatalogImage(img: Catalogue.image)),
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
                        color: Theme.of(context).accentColor)),
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
                            color: Theme.of(context).accentColor)),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).buttonColor)),
                      onPressed: () {},
                      label: Text('Add'),
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
