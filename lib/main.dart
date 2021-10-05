import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/providers/Items.dart';
import 'package:flutter_shopping_list/widgets/Wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (ctx) => Items(),
            child: Wrapper()
        ),
    );
  }
}

