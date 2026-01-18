// Import the core Flutter Material library for UI elements like MaterialApp, Scaffold, etc.
import 'package:dice_dungeons_nine/view_model/battle_view_model.dart';
import 'package:flutter/material.dart';

// Import the Provider package so we can inject and access shared ViewModels across screens, all todays magic is from here
import 'package:provider/provider.dart';

// Import the custom landing screen, this is our app’s first screen (home page) and first thing users will see
import 'package:dice_dungeons_nine/view/landing_screen.dart';

// Import the ViewModels, these hold all the business logic and shared app state
import 'package:dice_dungeons_nine/view_model/loot_view_model.dart';
import 'package:dice_dungeons_nine/view_model/enemy_view_model.dart';

void main() {
  // runApp is the entry point that tells Flutter what widget tree to render
  runApp(
    // MultiProvider lets us provide *multiple* ViewModels (shared data/state classes) to the entire app, this makes changes easy to manage
    // otherwise we have to do lots of message passing and messy stuff
    MultiProvider(
      providers: [
        // This provides a single instance of LootViewModel to the widget tree
        ChangeNotifierProvider(
          create: (_) => LootViewModel(),
        ),

        // (_) => LootViewModel() is short hand for the below
        // ChangeNotifierProvider(
        //   create: (BuildContext context) {
        //     return MyViewModel();
        //   },
        // )

        // This provides a single instance of EnemyViewModel to the widget tree
        ChangeNotifierProvider(
          create: (_) => EnemyViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => BattleViewModel(),
        ),

        // You can add more ViewModels here as your app grows, which will happen next week!
        // e.g. ChangeNotifierProvider(create: (_) => PlayerViewModel()), etc.
      ],

      // The child of MultiProvider is our actual app widget
      child: const DiceDungeonsApp(),
    ),
  );
}

// This is the root of your Flutter application
// We put it in its own class so the `runApp` call above can pass it into MultiProvider easily
class DiceDungeonsApp extends StatelessWidget {
  const DiceDungeonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner that usually appears in the top right corner
      debugShowCheckedModeBanner: false,

      // Set the LandingScreen as the first screen the user sees
      home: const LandingScreen(),
    );
  }
}
