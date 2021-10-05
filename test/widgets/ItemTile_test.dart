import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/widgets/Wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tapping the CheckBoxListTile should uncheck one of the Tiles', (WidgetTester tester) async {

    // Build widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Wrapper()));

    // Grab the first checkbox list tile.
    final checkBoxTile = find.byType(CheckboxListTile).first;

    // Tap the first checkbox.
    await tester.tap(checkBoxTile);
    await tester.pumpAndSettle();

    // Check that the value of the first checkbox is now true.
    var checkedCheckBox = find.byWidgetPredicate((widget)
    => widget is CheckboxListTile && widget.value == true).first;
    expect(checkedCheckBox, findsOneWidget);
    
    // Tap it again.
    await tester.tap(checkedCheckBox);
    await tester.pumpAndSettle();

    // If the first checkbox value has been changed to false.
    // There should now only be 3 checkboxes that are checked.
    checkedCheckBox = find.byWidgetPredicate((widget)
    => widget is CheckboxListTile && widget.value == true);
    expect(checkedCheckBox, findsNWidgets(3));
  });

  testWidgets('tapping the delete icon should remove one of the tiles', (WidgetTester tester) async {

    // Build widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Wrapper()));

    // Grab the first delete icon button.
    final checkBoxTile = find.byKey(ValueKey("Delete Button for 0"));

    // Tap it.
    await tester.tap(checkBoxTile);
    await tester.pumpAndSettle();

    expect(find.byType(CheckboxListTile), findsNWidgets(4));
  });
}
