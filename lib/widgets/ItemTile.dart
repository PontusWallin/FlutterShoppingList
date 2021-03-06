import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/services/database.dart';

class ItemTile extends StatefulWidget {

  final Item item;
  final int index;
  ItemTile(this.index, this.item);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final DatabaseService databaseService = DatabaseService();

  void _toggleCheckBox(bool isChecked) {
    setState(() {
      widget.item.isCollected = isChecked;
      databaseService.updateCollected(widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.item.name,
        style: TextStyle(fontSize: 32),
        textAlign: TextAlign.center,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.item.isCollected,
      onChanged: (isChecked) => {_toggleCheckBox(isChecked!)},
      secondary: IconButton(
        key: Key("Delete Button for " + widget.index.toString()),
        icon: Icon(Icons.delete), onPressed: () {
        databaseService.removeItem(widget.item.uid);
      }, ),
    );
  }
}
