import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // For ViewModel binding
import 'package:dice_dungeons_nine/gradient_background.dart';
import 'package:dice_dungeons_nine/view_model/loot_view_model.dart';

import 'package:dice_dungeons_nine/model/loot_model.dart';

// This screen shows random loot that can be selected from a tiered loot pool. As it will change, it will need to be stateful
class LootGenerationScreen extends StatelessWidget {
  const LootGenerationScreen({super.key});

  // Widget to display the image and details of selected loot
  Widget buildLootDisplay(LootItem? selectedLoot) {
    if (selectedLoot == null) {
      // Show placeholder circles and labels if no loot selected yet
      return const Column(
        children: [
          CircleAvatar(radius: 10),
          Text("Name"),
          CircleAvatar(radius: 10),
          Text("Class"),
          CircleAvatar(radius: 10),
          Text("Level"),
          CircleAvatar(radius: 10),
          Text("Attribute"),
        ],
      );
    }

    // Show selected loot's image and attributes
    return Column(
      children: [
        Image.asset(selectedLoot.imagePath, height: 80),
        Text("Name: ${selectedLoot.name}"),
        Text("Class: ${selectedLoot.itemClass}"),
        Text("Level: ${selectedLoot.level}"),
        Text("Attribute: ${selectedLoot.attribute}"),
      ],
    );
  }

  // Widget to build the loot tier selector UI
  Widget buildTierSelector(BuildContext context, LootViewModel lootViewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: Colors.white),
          onPressed: () => lootViewModel.changeLootTier(-1),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "${lootViewModel.lootTier}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text("Loot Tier", style: TextStyle(color: Colors.white)),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          onPressed: () => lootViewModel.changeLootTier(1),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: lootViewModel.generateRandomLoot,
          child: const Text("Generate Loot"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LootViewModel(),
      child: Consumer(
        builder: (context, lootViewModel, child) {
          // Wrap entire screen with gradient background
          return GradientBackground(
            child: Scaffold(
              backgroundColor: Colors.transparent, // Let gradient show through
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Image.asset('assets/images/logo.png'),
                    const SizedBox(height: 20),

                    // Loot display card
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Found Loot',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildLootDisplay((lootViewModel as LootViewModel)
                                .selectedLoot), // Show either placeholder or selected loot
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Loot tier selector and randomize button
                    buildTierSelector(context, lootViewModel),
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
