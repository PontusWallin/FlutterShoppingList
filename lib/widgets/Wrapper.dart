import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/providers/Items.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => Items(),
        child: Home());
  }
}
