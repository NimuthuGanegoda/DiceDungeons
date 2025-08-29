// Import the Dart math library to use the Random class for dice rolls.
import 'dart:math';

// Import Flutter Material package for widgets and styling.
import 'package:flutter/material.dart';

// Import your custom gradient background widget.
import 'gradient_background.dart';

// This is a stateful widget because the dice values (d6 and d20) will change when rolled.
class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  // Instead of using an abstract class, we return the state directly.
  @override
  State createState() {
    return _DiceScreenState();
  }
}

// This private state class manages the logic and UI for rolling dice.
class _DiceScreenState extends State {
  // A map to convert numeric dice values to word-based filenames for image lookup.
  final _numberWords = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fifteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
    20: 'twenty',
  };

  // Random object to simulate dice rolls.
  final _random = Random();

  // State variables to store the current dice values.
  int d6 = 1;
  int d20 = 1;

  // Function to roll a 6-sided die (D6)
  void rollD6() {
    setState(() => d6 = _random.nextInt(6) + 1); // Random value from 1 to 6
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Rolled D6: $d6')), // Show result in a snackbar
    );
  }

  // Function to roll a 20-sided die (D20)
  void rollD20() {
    setState(() => d20 = _random.nextInt(20) + 1); // Random value from 1 to 20
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Rolled D20: $d20')), // Show result in a snackbar
    );
  }

  // Build method renders the user interface.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Make background transparent so gradient shows.
      backgroundColor: Colors.transparent,

      // Use the custom reusable gradient background.
      body: GradientBackground(
        child: Column(
          children: [
            const SizedBox(height: 40), // Top padding

            // App title
            const Text(
              'Dice and Dungeons!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            const SizedBox(height: 20),

            // Dice roll buttons
            Column(
              children: [
                OutlinedButton(
                  onPressed: rollD6,
                  child: const Text('D6'), // Roll 6-sided die
                ),
                OutlinedButton(
                  onPressed: rollD20,
                  child: const Text('D20'), // Roll 20-sided die
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Display dice images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Show the current D6 image based on the rolled value
                Image.asset(
                  'assets/images/dice/d6/dice_${_numberWords[d6]}.png',
                  height: 50, // Small size for D6
                  fit: BoxFit.contain,
                ),

                // Show the current D20 image based on the rolled value
                Image.asset(
                  'assets/images/dice/d20/dice_${_numberWords[d20]}.png',
                  height: 100, // Larger size for D20
                  fit: BoxFit.contain,
                )
              ],
            ),

            const SizedBox(height: 20),

            // Back button to return to the previous screen
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
