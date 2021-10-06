import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/services/database.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
        value: DatabaseService().items,
        initialData: [],
        child: Home());
  }
}
