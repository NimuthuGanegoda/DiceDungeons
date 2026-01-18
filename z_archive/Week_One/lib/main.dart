// This imports the Flutter Material package, which gives us access
// to pre-built widgets like MaterialApp, Scaffold, AppBar, Text, etc.
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 206, 51, 51),
                Color.fromARGB(255, 45, 7, 98),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Dice and Dungeons!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

// This is the entry point of the Flutter app.
// The 'main' function runs first when the app starts.
void main() {
  // runApp is a built-in Flutter function that takes a widget
  // and makes it the root of the app.
  runApp(const MyApp());
}
