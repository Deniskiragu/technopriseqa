import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:technoprise/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Adding a new item', (tester) async {
    app.main();
    await tester.pumpAndSettle();


    // Tap the "+ New" button to add a new item
    await tester.ensureVisible(find.text('New'));
    await tester.tap(find.text('New'));
    await tester.pumpAndSettle();


    // Enter title and description
    await tester.enterText(find.widgetWithText(TextFormField, 'Enter a title for the item'), 'Denis Kiragu');
    await tester.enterText(find.widgetWithText(TextFormField, 'Enter a description for the item'), 'This is an integration test for adding an item');
    await tester.pumpAndSettle();

    // Tap the "Add Item" button
    final addItemButton = find.byType(GestureDetector).at(3);
    await tester.ensureVisible(addItemButton);
    await tester.tap(addItemButton);
    await tester.pumpAndSettle();

    // Verify the item is added by finding the title and description text
    expect(find.text('Denis Kiragu'), findsOneWidget);
    expect(find.text('This is an integration test for adding an item'), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
  });
}
