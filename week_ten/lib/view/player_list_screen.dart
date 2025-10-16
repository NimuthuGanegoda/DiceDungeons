import 'package:flutter/material.dart';
import 'package:dice_dungeons_ten/model/player_model.dart';
import 'package:dice_dungeons_ten/view/player_screen.dart';
import 'package:dice_dungeons_ten/gradient_background.dart';

// This screen shows a list of players in a scrollable list.
// Each player card can be tapped to navigate to their detail screen.
// ignore: must_be_immutable
class PlayerListScreen extends StatefulWidget {
  // Define a list of Player objects to display in the ListView.

  List<Player> players;

  PlayerListScreen({super.key, required this.players}); // Constructor takes the list

  @override
  State<PlayerListScreen> createState() {
    return _PlayerListScreenState();
  }
}

class _PlayerListScreenState extends State<PlayerListScreen> {
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
                  //  Flutter gives you access to the instance of the parent StatefulWidget via the widget property
                  itemCount: widget.players.length, // Number of items in the list
                  itemBuilder: (context, index) {
                    // Each player is displayed inside a Card with a ListTile.
                    return Card(
                      color: const Color.fromARGB(255, 165, 19, 112), // Dark red card background
                      child: ListTile(
                        // Show the player's name
                        title: Text(
                          //  Flutter gives you access to the instance of the parent StatefulWidget via the widget property
                          widget.players[index].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        // When the tile is tapped, navigate to the PlayerScreen
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // Pass the tapped player object to PlayerScreen
                              //  Flutter gives you access to the instance of the parent StatefulWidget via the widget property
                              builder: (context) => PlayerScreen(player: widget.players[index]),
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
