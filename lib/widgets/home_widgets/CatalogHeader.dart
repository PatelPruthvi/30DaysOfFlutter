import 'package:codepur/widgets/themes.dart';
import 'package:flutter/material.dart';

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Catalog App',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: MyTheme.darkBlue),
          ),
          Text(
            'Trending Products ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyTheme.darkBlue),
          )
        ],
      ),
    );
  }
}
