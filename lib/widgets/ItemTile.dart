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
  bool _isChecked = false;

  void toggleCheckBox(bool isChecked) {
    setState(() {_isChecked = isChecked;});
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
      value: _isChecked,
      onChanged: (isChecked) => {toggleCheckBox(isChecked!)},
    );
  }
}
