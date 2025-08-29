import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dice_dungeons_four/landing_screen.dart';

void main() {
  testWidgets('LandingScreen has a title and two buttons',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LandingScreen(),
    ));

    // Verify that our title is present.
    expect(find.text('Dice and Dungeons'), findsOneWidget);

    // Verify that our buttons are present.
    expect(find.widgetWithText(ElevatedButton, 'Player List'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Dice Roller'), findsOneWidget);
  });
}
