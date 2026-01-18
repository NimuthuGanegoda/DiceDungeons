import 'package:flutter/material.dart';
import 'package:dice_dungeons_five/screen/player_list_screen.dart'; // Imports the player list screen
import 'dice_screen.dart'; // Imports the dice roller screen
import 'package:dice_dungeons_five/gradient_background.dart'; // Imports reusable gradient background
import 'package:dice_dungeons_five/screen/create_player_screen.dart';
import 'package:dice_dungeons_five/model/player_model.dart';

// The LandingScreen is now stateful to hold players created at runtime.
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // Internal list to store players created from the form.
  final List<Player> _players = [
    Player(
      name: 'Player One',
      className: 'Warrior',
      health: 100,
      level: 5,
      imagePath: 'assets/images/player.png',
    ),
    Player(
      name: 'BIG BOY',
      className: 'Mage',
      health: 70,
      level: 4,
      imagePath: 'assets/images/player_two.png',
    ),
  ];

  // This method handles navigation to the Player List screen.
  void _goToPlayerList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerListScreen(
          players: _players,
        ), // Pushes the player list with current players
      ),
    );
  }

  // This method handles navigation to the Dice Roller screen.
  void _goToDiceScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const DiceScreen(), // Pushes the dice screen onto the stack
      ),
    );
  }

  // Navigate to CreatePlayerScreen and add the returned player to the list.
  Future<void> _goToCreatePlayerScreen(BuildContext context) async {
    final newPlayer = await Navigator.push<Player>(
      context,
      MaterialPageRoute(
        builder: (_) => const CreatePlayerScreen(),
      ),
    );

    if (newPlayer != null) {
      setState(() {
        _players.add(newPlayer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 165, 19, 112),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                'assets/images/icon.png',
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.group, color: Colors.white),
              title: const Text('Player List',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // close drawer
                _goToPlayerList(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.casino, color: Colors.white),
              title: const Text('Dice Roller',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _goToDiceScreen(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.white),
              title: const Text('Create Player',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _goToCreatePlayerScreen(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent, // Allows the gradient to show
      body: GradientBackground(
        // Wraps content in a reusable gradient background
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align children at the top
          children: [
            const SizedBox(height: 60), // Spacer at the top
            Image.asset(
              'assets/images/icon.png',
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            // Hamburger icon to open the drawer using Builder for Scaffold context
            Row(
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 40),
            const Text(
              'Swipe or tap top-left to open menu',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
