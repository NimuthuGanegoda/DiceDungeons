import 'package:flutter/material.dart';
import 'package:dice_dungeons_four/player_list.dart'; // Imports the player list screen
import 'dice_screen.dart'; // Imports the dice roller screen
import 'package:dice_dungeons_four/gradient_background.dart'; // Imports reusable gradient background

// The LandingScreen is a stateless widget and serves as the app's home page.
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  // This method handles navigation to the Player List screen.
  void _goToPlayerList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerListScreen(), // Pushes the player list onto the screen stack
      ),
    );
  }

  // This method handles navigation to the Dice Roller screen.
  void _goToDiceScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DiceScreen(), // Pushes the dice screen onto the stack
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Allows the gradient to show
      body: GradientBackground(
        // Wraps content in a reusable gradient background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align children at the top
          children: [
            const SizedBox(height: 60), // Spacer at the top
            const Text(
              'Dice and Dungeons!', // App title
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // White text for contrast
              ),
            ),
            const SizedBox(height: 60), // Space between title and buttons

            // Align the buttons to the left side of the screen
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Player List Button
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white, // Button text color
                      side: const BorderSide(color: Colors.white), // White border
                      backgroundColor: Color.fromARGB(255, 97, 0, 73), // Button background
                    ),
                    onPressed: () => _goToPlayerList(context), // Navigate on press
                    child: const Text('Player List'),
                  ),

                  // Dice Roller Button
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: Color.fromARGB(255, 97, 0, 73),
                    ),
                    onPressed: () => _goToDiceScreen(context), // Navigate on press
                    child: const Text('Dice Roller'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
