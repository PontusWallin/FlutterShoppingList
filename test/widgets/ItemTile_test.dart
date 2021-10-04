import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/widgets/Home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tapping the CheckBoxListTile', (WidgetTester tester) async {

    // Build widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Grab the first checkbox list tile.
    final checkBoxTile = find.byType(CheckboxListTile).first;

    // Tap it.
    await tester.tap(checkBoxTile);
    await tester.pumpAndSettle();

    // Check that there is now exactly one checkbox list tile whose value is true.
    var checkedCheckBox = find.byWidgetPredicate((widget)
    => widget is CheckboxListTile && widget.value == true);
    expect(checkedCheckBox, findsOneWidget);


    // Tap it again.
    await tester.tap(checkedCheckBox);
    await tester.pumpAndSettle();

    // Check that there is now no checkbox list tiles whose value is true.
    checkedCheckBox = find.byWidgetPredicate((widget)
    => widget is CheckboxListTile && widget.value == true);
    expect(checkedCheckBox, findsNothing);
  });
}
