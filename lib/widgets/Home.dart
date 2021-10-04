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
    Item('Apples', false),
    Item('Milk', false),
    Item('Bread', true),
    Item('Ketchup', true),
    Item('Chocolate Chip Cookies', true),
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
                child: Column(children: [
                  TextField(
                    key: Key("addItemInputField"),
                    decoration: InputDecoration(labelText: 'Item Name'),
                    onChanged: (value) {
                      nameInput = value;
                    },
                  ),
                  IconButton(
                      key: Key('addItemButton'),
                      icon: Icon(Icons.add),
                      onPressed: () => {
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
          key: Key("addFromAppHeader"),
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
        key: Key("addItemFOB"),
        child: Icon(Icons.add),
        onPressed: () => _startAddNewItem(context),
      ),
    );
  }
}
