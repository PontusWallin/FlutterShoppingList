import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';

class Items with ChangeNotifier {
  List<Item> _items = [
    Item('Apples', false),
    Item('Milk', false),
    Item('Bread', true),
    Item('Ketchup', true),
    Item('Chocolate Chip Cookies', true),
  ];

  List<Item> get items => [..._items];

  void addItem(String itemName) {
    _items.add(Item(itemName, false));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}