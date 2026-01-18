import 'package:flutter/material.dart';
import 'player_model.dart';
import 'player_screen.dart';
import 'package:dice_dungeons_four/gradient_background.dart';

// This screen shows a list of players in a scrollable list.
// Each player card can be tapped to navigate to their detail screen.
class PlayerListScreen extends StatelessWidget {
  // Define a list of Player objects to display in the ListView.
  final List<Player> players = [
    Player(
        name: 'Player One',
        className: 'Warrior',
        imagePath: 'assets/images/player.png'),
    Player(
        name: 'BIG BOY',
        className: 'Mage',
        imagePath: 'assets/images/player_two.png'),
  ];

  PlayerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background to transparent so our custom gradient can be shown underneath.
      backgroundColor: Colors.transparent,

      // Use our custom GradientBackground widget.
      // It accepts any widget as a child and wraps it with a consistent gradient background.
      body: GradientBackground(
        // SafeArea ensures the UI doesn't get hidden behind notches or status bars.
        child: SafeArea(
          child: Column(
            children: [
              // Header Text
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Dice and Dungeons!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),

              // Expanded allows the ListView to take up the remaining vertical space.
              Expanded(
                // ListView.builder creates list items lazily (efficient for long lists).
                child: ListView.builder(
                  itemCount: players.length, // Number of items in the list
                  itemBuilder: (context, index) {
                    // Each player is displayed inside a Card with a ListTile.
                    return Card(
                      color: const Color.fromARGB(
                          255, 165, 19, 112), // Dark red card background
                      child: ListTile(
                        // Show the player's name
                        title: Text(
                          players[index].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        // When the tile is tapped, navigate to the PlayerScreen
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // Pass the tapped player object to PlayerScreen
                              builder: (context) =>
                                  PlayerScreen(player: players[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
