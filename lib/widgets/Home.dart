import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';

import 'ItemList.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> shoppingItems = [
    Item('Item 1', false),
    Item('Item 2', false),
    Item('Item 3', true),
    Item('Item 4', true),
    Item('Item 5', true),
  ];

  String nameInput = '';

  void addNewItem(String name) {
    final newItem = Item(name, false);

    setState(() {
      shoppingItems.add(newItem);
    });
  }

  void _startAddNewItem(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return Container(
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Column(
                    children: [
                      TextField(
                      decoration: InputDecoration(labelText: 'Item Name'),
                        onChanged: (value) {
                          nameInput = value;
                        },
                      ),
                      IconButton(icon: Icon(Icons.add), onPressed: () => {
                        addNewItem(nameInput),
                        Navigator.pop(context),
                      }),
                    ]),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List App'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewItem(context),
        )
      ]),
      body: Container(
        margin: EdgeInsets.all(14),
        child: ItemList(shoppingItems: shoppingItems),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewItem(context),
      ),
    );
  }
}
