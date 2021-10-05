import 'package:flutter_shopping_list/providers/Items.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('adding an item should increase the size of the item list by one', () {
    // setup
    final Items testItems = Items();
    final previousItemListLength = testItems.items.length;
    // run
    testItems.addItem('Test Item');
    // verify
    expect(testItems.items.length, previousItemListLength+1);
  });

  test('after adding a new item, we should find one item, and only one item with that new items name inside the item list', (){
    // setup
    final Items testItems = Items();
    // run
    testItems.addItem('Test Item');
    // verify
    expect(testItems.items.map((e) => e.name == 'Test Item')
        .where((element) => element == true)
        .length, 1);
  });

  test('removing an item should decrease the size of the item list by one', () {
    // setup
    final Items testItems = Items();
    final previousItemListLength = testItems.items.length;
    // run
    testItems.removeItem(0);
    // verify
    expect(testItems.items.length, previousItemListLength-1);
  });


  test('after removing a new item, we should no longer find an item with that items name inside the item list', (){
    // setup
    final Items testItems = Items();
    // run
    testItems.addItem('Delete Me');
    testItems.removeItem(testItems.items.length-1);
    // verify
    expect(testItems.items.any((item) => item.name == 'Delete Me'), false);
  });

}