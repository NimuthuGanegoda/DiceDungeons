import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dice_dungeons_seven/gradient_background.dart';
import 'package:dice_dungeons_seven/view_model/enemy_view_model.dart';

class EnemyGenerationsScreen extends StatelessWidget {
  const EnemyGenerationsScreen({super.key});

  Widget buildEnemyDisplay(enemy) {
    if (enemy == null) {
      return const Column(
        children: [
          CircleAvatar(radius: 10),
          Text("Name"),
          CircleAvatar(radius: 10),
          Text("Type"),
          CircleAvatar(radius: 10),
          Text("Level"),
          CircleAvatar(radius: 10),
          Text("Attribute"),
        ],
      );
    }
    return Column(
      children: [
        Image.asset(enemy.imagePath, height: 80),
        Text("Name: ${enemy.name}"),
        Text("Type: ${enemy.enemyType}"),
        Text("Level: ${enemy.level}"),
        Text("Attribute: ${enemy.attribute}"),
      ],
    );
  }

  Widget buildTierSelector(
      BuildContext context, EnemyViewModel enemyViewModel) {
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
        ElevatedButton(
          onPressed: enemyViewModel.generateRandomEnemy,
          child: const Text("Random Enemy"),
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
                    Image.asset('assets/images/logo.png'),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Random Enemy',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildEnemyDisplay(enemyViewModel.selectedEnemy),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
