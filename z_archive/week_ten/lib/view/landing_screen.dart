import 'package:flutter/material.dart';
import 'package:dice_dungeons_ten/view/player_list_screen.dart'; // Imports the player list screen
import 'package:dice_dungeons_ten/view/dice_screen.dart'; // Imports the dice roller screen
import 'package:dice_dungeons_ten/view/create_player_screen.dart'; // Imports the create player form screen
import 'package:dice_dungeons_ten/view/loot_generation_screen.dart'; // Imports the loot screen
import 'package:dice_dungeons_ten/view/enemy_generation_screen.dart'; // Imports the enemy screen
import 'package:dice_dungeons_ten/model/player_model.dart'; // Imports Player model
import 'package:dice_dungeons_ten/gradient_background.dart'; // Imports reusable gradient background
import 'package:dice_dungeons_ten/view/turn_order_list.dart';
import 'package:dice_dungeons_ten/view/BattleLogViewModel.dart'; // Import your new screen

// The LandingScreen is a stateless widget and serves as the app's home page.
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Player> players = []; // Maintain list of players locally

  // This method handles navigation to the Player List screen
  void _goToPlayerList(BuildContext context) {
    Navigator.pop(context); // Close the drawer before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerListScreen(players: players), // Pass the current player list
      ),
    );
  }

  // This method handles navigation to the Dice Roller screen
  void _goToDiceScreen(BuildContext context) {
    Navigator.pop(context); // Close the drawer before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DiceScreen(),
      ),
    );
  }

  // This method handles navigation to the Loot Generation Screen
  void _goToLootGenerationScreen(BuildContext context) {
    Navigator.pop(context); // Close the drawer before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LootGenerationScreen(),
      ),
    );
  }

  // This method handles navigation to the enemy Generation Screen
  void _goToEnemyGenerationScreen(BuildContext context) {
    Navigator.pop(context); // Close the drawer before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EnemyGenerationScreen(),
      ),
    );
  }

  // This method handles navigation to the Create Player screen and captures the result
  Future<void> _goToCreatePlayerScreen(BuildContext context) async {
    Navigator.pop(context); // Close the drawer first
    final newPlayer = await Navigator.push<Player>(
      context,
      MaterialPageRoute(builder: (_) => const CreatePlayerScreen()),
    );

    // If a player was returned (not null), update the player list
    if (newPlayer != null) {
      setState(() {
        players.add(newPlayer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Allows the gradient to show

      // Add a navigation drawer to allow side-swipe and menu access
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 247, 42, 76), // Match app style
        child: GradientBackground(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            children: [
              Image.asset('assets/images/logo.png'),
              // const Text(
              //   'Dice and Dungeons!',
              //   style: TextStyle(color: Colors.white, fontSize: 24),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 20),

              // Player List
              ListTile(
                leading: const Icon(Icons.group, color: Colors.white),
                title: const Text('Player List', style: TextStyle(color: Colors.white)),
                onTap: () => _goToPlayerList(context),
              ),

              // Dice Roller
              ListTile(
                leading: const Icon(Icons.casino, color: Colors.white),
                title: const Text('Dice Roller', style: TextStyle(color: Colors.white)),
                onTap: () => _goToDiceScreen(context),
              ),

              // Loot Generation screen
              ListTile(
                leading: const Icon(Icons.business_center, color: Colors.white),
                title: const Text('Loot', style: TextStyle(color: Colors.white)),
                onTap: () => _goToLootGenerationScreen(context),
              ),

              // Loot Generation screen
              ListTile(
                leading: const Icon(Icons.groups_2, color: Colors.white),
                title: const Text('Enemy', style: TextStyle(color: Colors.white)),
                onTap: () => _goToEnemyGenerationScreen(context),
              ),

              // Create Player
              ListTile(
                leading: const Icon(Icons.add, color: Colors.white),
                title: const Text('Create Player', style: TextStyle(color: Colors.white)),
                onTap: () => _goToCreatePlayerScreen(context), // Now captures return value
              ),
            ],
          ),
        ),
      ),

      // The main content of the landing screen
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align children at the top
          children: [
            const SizedBox(height: 60), // Spacer at the top

            Image.asset('assets/images/logo.png'),

            // const Text(
            //   'Dice and Dungeons!', // App title
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Colors.white, // White text for contrast
            //   ),
            // ),

            Row(
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white), // White hamburger icon
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // This will now work
                      },
                    );
                  },
                ),
                // Battle Log Icon Button
                IconButton(
                  icon: const Icon(Icons.description, color: Colors.white),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BattleLogScreen()),
                     );
                  },
                ),  
              ],
            ),

            Expanded(
              // This allows TurnOrderList to grow and take all available space
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TurnOrderList(),
              ),
            ),

            const SizedBox(height: 20), // Space between title and buttons
            // const Spacer(),

            ElevatedButton(
              onPressed: () => {},
              child: const Text("Start Battle"),
            ),
            const Text(
              'Swipe or tap top-left to open menu',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
