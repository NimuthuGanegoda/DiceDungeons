import 'package:dice_dungeons_3/player_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PlayerList has a title and players',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: PlayerList(),
    ));

    // Verify that our title is present.
    expect(find.text('Dice and Dungeons!'), findsOneWidget);

    // Verify that our players are present.
    expect(find.text('Player One'), findsOneWidget);
    expect(find.text('BIG BOY'), findsOneWidget);
  });
}
