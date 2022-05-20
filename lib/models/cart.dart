// ignore_for_file: unused_field

import 'package:codepur/models/catalog.dart';

class CartModel {
  late CatalogModel catalog;
  final List<int> _itemID = [];

  List<Item> get items => _itemID.map((id) => catalog.getById(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemID.add(item.id);
  }

  void remove(Item item) {
    _itemID.remove(item.id);
  }
}
