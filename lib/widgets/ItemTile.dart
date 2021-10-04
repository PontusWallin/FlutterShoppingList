import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  ItemTile(this.item);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {

  void _toggleCheckBox(bool isChecked) {
    setState(() {
      widget.item.isCollected = isChecked;
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
      secondary: IconButton(icon: Icon(Icons.delete), onPressed: () {}, ),
    );
  }
}
