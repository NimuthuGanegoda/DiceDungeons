
// Import the core Flutter Material library for UI elements like MaterialApp, Scaffold, etc.
import 'package:dice_dungeons_ten/view_model/battle_log_view_model.dart';
import 'package:dice_dungeons_ten/view_model/battle_view_model.dart';
import 'package:flutter/material.dart';

// Import the Provider package so we can inject and access shared ViewModels across screens, all todays magic is from here
import 'package:provider/provider.dart';

// Import the custom landing screen, this is our app’s first screen (home page) and first thing users will see
import 'package:dice_dungeons_ten/view/landing_screen.dart';

// Import the ViewModels, these hold all the business logic and shared app state
import 'package:dice_dungeons_ten/view_model/loot_view_model.dart';
import 'package:dice_dungeons_ten/view_model/enemy_view_model.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // required before using async or platform cells

  await determinePosition();

  runApp(
    MultiProvider(
      providers: [
        // This provides a single instance of LootViewModel to the widget tree
        ChangeNotifierProvider(
          create: (_) => LootViewModel(),
        ),

        // This provides a single instance of EnemyViewModel to the widget tree
        ChangeNotifierProvider(
          create: (_) => EnemyViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => BattleViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => BattleLogViewModel(),
        ),
        // You can add more ViewModels here as your app grows, which will happen next week!
        // e.g. ChangeNotifierProvider(create: (_) => PlayerViewModel()), etc.
      ],

      // The child of MultiProvider is our actual app widget
      child: const DiceDungeonsApp(),
    ),
  );
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
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
