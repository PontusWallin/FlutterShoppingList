import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/widgets/ItemList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Item> shoppingItems = [
    Item('Item 1', false),
    Item('Item 2', false),
    Item('Item 3', true),
    Item('Item 4', true),
    Item('Item 5', true),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Shopping List App'),
          ),
          body: Container(
            margin: EdgeInsets.all(14),
            child: ItemList(shoppingItems: shoppingItems),
          ),
        )
    );
  }
}

