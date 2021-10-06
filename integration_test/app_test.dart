import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_shopping_list/main.dart' as app;
import 'package:uuid/uuid.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'clicking the button in the app header will open the Bottom Modal Panel',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final addButtonHeader = find.byKey(ValueKey("addFromAppHeader"));

      // Execute the test.
      await tester.tap(addButtonHeader);
      await tester.pumpAndSettle();

      // Check results.
      expect(find.byKey(ValueKey("addItemInputField")), findsOneWidget);
    });
  });

  testWidgets(
      'clicking the floating action button will open the Bottom Modal Panel',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Find all widgets needed.
    final addItemFOB = find.byKey(ValueKey('addItemFOB'));

    // Execute the tests.
    await tester.tap(addItemFOB);
    await tester.pumpAndSettle();

    // Check results.
    expect(find.byKey(ValueKey("addItemInputField")), findsOneWidget);
  });

  testWidgets('it should be possible to add new item to the shopping list',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Find the widgets needed.
    String itemName = await addTestItemToShoppingList(tester);

    // Check results.
    final itemNameSearch = find.text(itemName);
    expect(itemNameSearch, findsOneWidget);

    // Delete the test item, so it doesn't pollute the database
    await deleteTileBasedOnItemName(itemName, tester);
  });

  testWidgets(
      'tapping the CheckBoxListTile should switch the checked state of one of the Tiles',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Grab the first checkbox list tile.
    final checkBoxTile = find.byType(CheckboxListTile).first;
    final checkBoxTileAsWidget =
        checkBoxTile.evaluate().first.widget as CheckboxListTile;
    // And get it's checkbox value ( true or false depending on the initial state of the checkbox).
    final originalValue = checkBoxTileAsWidget.value;

    final findAllCheckBoxesWithSameValue = find.byWidgetPredicate((widget) =>
        widget is CheckboxListTile && widget.value == originalValue);

    // Save the number of checkboxes with the original value, before we tap the checkbox.
    final numberOfCheckboxesWithSameValueBeforeTest =
        tester.widgetList(findAllCheckBoxesWithSameValue).length;

    // Tap the first checkbox.
    await tester.tap(checkBoxTile);
    await tester.pumpAndSettle();

    // Get the number of checkboxes with the original state
    // ( true or false depending on the initial state of the checkbox)
    // and compare this to how many checkboxes have this state now, after the tap
    final numberOfCheckboxesWithSameValueAfterFirstTap =
        tester.widgetList(findAllCheckBoxesWithSameValue).length;
    expect(numberOfCheckboxesWithSameValueAfterFirstTap,
        numberOfCheckboxesWithSameValueBeforeTest - 1);

    // Do the same thing in reverse. Now we want to toggle the first checkbox back to it's original state
    // and verify that the the number of checkboxes in this state are back to the number it was before.

    await tester.tap(checkBoxTile);
    await tester.pumpAndSettle();

    final numberOfCheckboxesWithSameValueAfterSecondTap =
        tester.widgetList(findAllCheckBoxesWithSameValue).length;
    expect(numberOfCheckboxesWithSameValueAfterSecondTap,
        numberOfCheckboxesWithSameValueBeforeTest);
  });

  testWidgets('tapping the delete icon should remove one of the tiles',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // First we add a test item to the shopping list, so we can delete it later.
    // We store the name of this item, so we can find it when we want to delete it.
    String itemName = await addTestItemToShoppingList(tester);

    final findAllTiles = find.byType(CheckboxListTile);
    final numberOfTilesBeforeTap = tester.widgetList(findAllTiles).length;

    // Delete the test item, so it doesn't pollute the database
    await deleteTileBasedOnItemName(itemName, tester);

    final numberOfTilesAfterTap = tester.widgetList(findAllTiles).length;

    expect(numberOfTilesAfterTap, numberOfTilesBeforeTap - 1);
  });
}

Future<void> deleteTileBasedOnItemName(
    String itemName, WidgetTester tester) async {

  final parentTile = find.text(itemName)
      .evaluate()
      .first
      .findAncestorWidgetOfExactType<CheckboxListTile>();
  final deleteButtonKey = parentTile!.secondary!.key;
  final deleteButton = find.byKey(deleteButtonKey!);
  // Finally, delete the test item from the list.
  await tester.tap(deleteButton);
  await tester.pumpAndSettle();
}

Future<String> addTestItemToShoppingList(WidgetTester tester) async {
  // Set up.
  final addItemFOB = find.byKey(ValueKey('addItemFOB'));
  await tester.tap(addItemFOB);
  await tester.pumpAndSettle();

  final itemInputField = find.byKey(ValueKey('addItemInputField'));
  final addItemButton = find.byKey(ValueKey('addItemButton'));

  // Execute.
  final itemName = "Test Item - please delete: " + Uuid().v4();
  await tester.enterText(itemInputField, itemName);
  await tester.pumpAndSettle();
  await tester.tap(addItemButton);
  await tester.pumpAndSettle();
  return itemName;
}
