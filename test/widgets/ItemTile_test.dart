import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/widgets/Home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tapping the CheckBoxListTile', (WidgetTester tester) async {

    // Build widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Home()));

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
}
