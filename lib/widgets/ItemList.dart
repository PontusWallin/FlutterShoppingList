import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.shoppingItems,
  }) : super(key: key);

  final List<Item> shoppingItems;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: shoppingItems.map((item) {
        return Text(
          item.name,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        );
      }).toList(),
    );
  }
}