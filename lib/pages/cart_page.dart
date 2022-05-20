// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types

import 'package:codepur/models/cart.dart';
import 'package:codepur/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _cartList(),
          ),
        ),
        Divider(),
        _cartTotal()
      ]),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          '\$ ${CartModel().totalPrice}',
          style: TextStyle(fontSize: 26, color: Theme.of(context).accentColor),
        ),
        SizedBox(width: 20),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).buttonColor)),
            onPressed: () {
              const s = SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Buying Not Supported Yet'));
              ScaffoldMessenger.of(context).showSnackBar(s);
            },
            child: Text('Buy')),
      ]),
    );
  }
}

class _cartList extends StatefulWidget {
  const _cartList({Key? key}) : super(key: key);

  @override
  State<_cartList> createState() => __cartListState();
}

class __cartListState extends State<_cartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CartModel().items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline), onPressed: () {}),
              title: Text(CartModel().items[index].name),
            ));
  }
}
