import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/widgets/ItemTile.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.shoppingItems,
  }) : super(key: key);

  final List<Item> shoppingItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (context, index) {
          return ItemTile(index, shoppingItems[index]);
        });
  }
}
