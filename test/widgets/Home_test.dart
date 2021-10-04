import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shopping_list/widgets/Home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('clicking the button in the app header', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Home()));
    // Find all widgets needed.
    final addButtonHeader = find.byKey(ValueKey("addFromAppHeader"));

    // Execute the test.
    await tester.tap(addButtonHeader);
    await tester.pumpAndSettle();
    
    // Check results.
    expect(find.byKey(ValueKey("addItemInputField")), findsOneWidget);
  });
  
  testWidgets('clicking the floating action button', (WidgetTester tester) async {

    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Find all widgets needed.
    final addItemFOB = find.byKey(ValueKey('addItemFOB'));

    // Execute the tests.
    await tester.tap(addItemFOB);
    await tester.pumpAndSettle();
    
    // Check results.
    expect(find.byKey(ValueKey("addItemInputField")), findsOneWidget);
  });

  testWidgets('adding a new item to the shopping list', (WidgetTester tester) async {

    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Set up the test.
    final addItemFOB = find.byKey(ValueKey('addItemFOB'));
    await tester.tap(addItemFOB);
    await tester.pumpAndSettle();
    
    // Find the widgets needed.
    final itemInputField = find.byKey(ValueKey('addItemInputField'));
    final addItemButton = find.byKey(ValueKey('addItemButton'));

    // Execute the tests.
    await tester.enterText(itemInputField, 'Test Item');
    await tester.pumpAndSettle();
    await tester.tap(addItemButton);
    await tester.pumpAndSettle();

    // Check results.
    expect(find.text('Test Item'), findsOneWidget);
  });
}
