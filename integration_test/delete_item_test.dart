import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:technoprise/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Deleting Existing item', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify initial list items are displayed
    expect(find.text('Rainforest Ecosystems'), findsOneWidget);
    expect(find.text('Space Exploration'), findsOneWidget);
    expect(find.text('Ancient Civilizations'), findsOneWidget);
    expect(find.text('Renewable Energy'), findsOneWidget);

    // Tap the delete icon of the first item ("Rainforest Ecosystems")
    final deleteButton = find.byIcon(Icons.delete_outlined).first;
    await tester.tap(deleteButton);
    await tester.pumpAndSettle();

    // Verify that "Rainforest Ecosystems" is removed from the list
    expect(find.text('Rainforest Ecosystems'), findsNothing);

    // Verify remaining items in the list
    expect(find.text('Space Exploration'), findsOneWidget);
    expect(find.text('Ancient Civilizations'), findsOneWidget);
    expect(find.text('Renewable Energy'), findsOneWidget);
  });
}
