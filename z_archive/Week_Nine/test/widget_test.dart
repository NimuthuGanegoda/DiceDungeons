import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:dice_dungeons_nine/view/landing_screen.dart';
import 'package:dice_dungeons_nine/view_model/battle_view_model.dart';

void main() {
  testWidgets('LandingScreen shows banner and drawer hint',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => BattleViewModel(),
        child: MaterialApp(
          home: LandingScreen(),
        ),
      ),
    );

    // Verify there is an image banner at the top.
    expect(find.byType(Image), findsWidgets);

    // Verify new helper text and menu icon are present.
    expect(find.text('Swipe or tap top-left to open menu'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsWidgets);
  });
}
