import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List<String> shoppingItems = ['item1', 'item2', 'item3'];

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
        body: ListView(
          children: [Text(shoppingItems.first), Text(shoppingItems[1]), Text(shoppingItems[2])]),
      ),
    );
  }
}