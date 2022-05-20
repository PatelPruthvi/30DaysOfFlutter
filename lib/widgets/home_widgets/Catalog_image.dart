import 'package:flutter/material.dart';

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
            color: Theme.of(context).canvasColor,
          ),
          child: Image.network(
            img,
          )),
    );
  }
}
