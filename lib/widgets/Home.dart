import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/providers/Items.dart';
import 'package:provider/provider.dart';

import 'ItemList.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String nameInput = '';

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
                        Provider.of<Items>(context, listen: false).addItem(nameInput),
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
    final itemsData = Provider.of<Items>(context);
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
        child: ItemList(shoppingItems: itemsData.items),
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
