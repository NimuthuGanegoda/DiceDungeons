import 'package:dice_dungeons_ten/model/battle_participant_model.dart';
import 'package:dice_dungeons_ten/view_model/battle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // For ViewModel binding
import 'package:dice_dungeons_ten/gradient_background.dart';
import 'package:dice_dungeons_ten/view_model/enemy_view_model.dart'; // Your ViewModel for enemies
import 'package:dice_dungeons_ten/model/enemy_model.dart'; // Your enemy model class

// This screen shows random enemy encounters that can be selected from a tiered enemy pool.
class EnemyGenerationScreen extends StatelessWidget {
  const EnemyGenerationScreen({super.key});

  // Widget to display the image and details of selected enemy
  Widget buildEnemyDisplay(EnemyItem? selectedEnemy) {
    if (selectedEnemy == null) {
      // Show placeholder if no enemy is selected yet
      return const Column(
        children: [
          CircleAvatar(radius: 10),
          Text("Name"),
          CircleAvatar(radius: 10),
          Text("Class"),
          CircleAvatar(radius: 10),
          Text("Level"),
          CircleAvatar(radius: 10),
          Text("Attack Strength"),
        ],
      );
    }

    // Show selected enemy's image and attributes
    return Column(
      children: [
        Image.asset(selectedEnemy.imagePath, height: 80),
        Text("Name: ${selectedEnemy.name}"),
        Text("Class: ${selectedEnemy.enemyClass}"),
        Text("Level: ${selectedEnemy.level}"),
        Text("Attack Strength: ${selectedEnemy.attackStrength}"),
      ],
    );
  }

  // Widget to build the enemy tier selector and generation button
  Widget buildTierSelector(BuildContext context, EnemyViewModel enemyViewModel) {
    // Method to add an enemy to our battle screen
    void addEnemy() {
      final enemyVM = Provider.of<EnemyViewModel>(context, listen: false);
      final battleVM = Provider.of<BattleViewModel>(context, listen: false);

      final selected = enemyVM.selectedEnemy;

      if (selected != null) {
        battleVM.addEnemy(
          BattleParticipant(
            name: selected.name,
            imagePath: selected.imagePath,
            attack: selected.attackStrength,
            health: selected.level * 2, // or whatever formula you want
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: Colors.white),
          onPressed: () => enemyViewModel.changeEnemyTier(-1),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "${enemyViewModel.enemyTier}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text("Enemy Tier", style: TextStyle(color: Colors.white)),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          onPressed: () => enemyViewModel.changeEnemyTier(1),
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: enemyViewModel.generateRandomEnemy,
              child: const Text("Random Enemy"),
            ),
            const SizedBox(width: 60),
            ElevatedButton(
              onPressed: addEnemy, // newly created method above
              child: const Text("Add Enemy"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EnemyViewModel(),
      child: Consumer<EnemyViewModel>(
        builder: (context, enemyViewModel, child) {
          return GradientBackground(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App logo
                    Image.asset('assets/images/logo.png'),
                    const SizedBox(height: 20),

                    // Card to display enemy
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Enemy Encounter',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildEnemyDisplay(enemyViewModel.selectedEnemy),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tier selector and button
                    buildTierSelector(context, enemyViewModel),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
