// Import the Flutter Material package that provides ready-to-use widgets.
import 'package:flutter/material.dart';

// Define a stateful widget to manage dynamic player stats.
class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  // Directly return the state object without using an abstract class.
  @override
  State createState() {
    return _PlayerScreenState();
  }
}

// This private class holds the mutable state for PlayerScreen.
class _PlayerScreenState extends State {
  int health = 10; // Starting health value
  int level = 1; // Starting level value

  // Example player info (could later be replaced with a player model).
  final String playerName = "You";
  final String playerClass = "Human";

  // Function to increase health
  void increaseHealth() {
    setState(() {
      health++;
    });
  }

  // Function to decrease health
  void decreaseHealth() {
    setState(() {
      health--;
    });
  }

  // Function to increase level
  void increaseLevel() {
    setState(() {
      level++;
    });
  }

  // Function to decrease level
  void decreaseLevel() {
    setState(() {
      level--;
    });
  }

  // Build method to render the screen UI.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // So the gradient shows through

      // The main body container with full-screen size and gradient background.
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Gradient starts at the top-left
            end: Alignment.bottomRight, // And ends at bottom-right
            colors: [
              Color.fromARGB(255, 247, 42, 76), // Bright red
              Color.fromARGB(255, 97, 0, 73), // Deep purple
            ],
          ),
        ),

        // Column arranges elements vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centered vertically
          children: [
            // App title
            const Text(
              'Dice and Dungeons!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20), // Spacer

            // Player image (must exist in assets folder)
            Image.asset(
              'assets/images/player.png',
              width: 250,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            // Row to display player's name and class
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Name: $playerName', style: const TextStyle(color: Colors.white)),
                Text('Class: $playerClass', style: const TextStyle(color: Colors.white)),
              ],
            ),

            const SizedBox(height: 10),

            // Row to display current health and level
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Health: $health', style: const TextStyle(color: Colors.white)),
                Text('Level: $level', style: const TextStyle(color: Colors.white)),
              ],
            ),

            const SizedBox(height: 10),

            // Buttons to control health and level
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: increaseHealth, child: const Text('HP+')),
                ElevatedButton(onPressed: decreaseHealth, child: const Text('HP-')),
                ElevatedButton(onPressed: increaseLevel, child: const Text('Lvl+')),
                ElevatedButton(onPressed: decreaseLevel, child: const Text('Lvl-')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
