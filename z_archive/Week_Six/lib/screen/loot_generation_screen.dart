
import 'dart:convert'; // For decoding JSON
import 'dart:math'; // For generating random numbers

import 'package:flutter/material.dart'; // Access to widgets
import 'package:flutter/services.dart'; // To load assets

import 'package:dice_dungeons_six/gradient_background.dart'; // Custom background widget we have been using a lot

// This screen shows random loot that can be selected from a tiered loot pool. As it will change, it will need to be stateful
class LootGenerationScreen extends StatefulWidget {
  const LootGenerationScreen({super.key});

  @override
  State createState() {
    return _LootGenerationScreenState();
  }
}

class _LootGenerationScreenState extends State {
  int _lootTier = 1; // The currently selected loot tier (1, 2, or 3)
  List _lootList = []; // List of loot items loaded from JSON
  Map? _selectedLoot; // The currently displayed loot item

  @override
  void initState() {
    super.initState();
    _loadLootJson(); // Load loot data when screen initialises
  }

  // Load loot JSON from assets and filter by selected tier
  // This future function will give you a result in the future, not immediately.
  Future _loadLootJson() async {
    // This function will run asynchronously (in the background), and it may take time (like reading a file or downloading data)."
    final String jsonString = await rootBundle.loadString('assets/data/loot.json'); // Load file
    // Wait here until the background task finishes, then continue.
    final Map jsonData = json.decode(jsonString); // Decode JSON

    // Update loot list from selected tier
    setState(() {
      // ?? [] means, that if there’s no data for this tier (e.g. it doesn’t exist), then just use an empty list [] instead."
      _lootList = jsonData['tier$_lootTier'] ?? []; // fallback to empty list, error prevention
    });
  }

  // Updates the loot tier by a delta (e.g., -1 or +1)
  void changeLootTier(int delta) async {
    final int newTier = _lootTier + delta;

    // Only allow tier between 1 and 3
    if (newTier >= 1 && newTier <= 3) {
      setState(() {
        _lootTier = newTier;
        _selectedLoot = null; // Clear previous loot
      });

      // Reload loot list for new tier
      final String jsonString = await rootBundle.loadString('assets/data/loot.json');
      final Map jsonData = json.decode(jsonString);

      setState(() {
        _lootList = jsonData['tier$_lootTier'] ?? [];
      });
    }
  }

  // Selects a random loot item from the current tier's list
  void generateRandomLoot() {
    if (_lootList.isNotEmpty) {
      final int randomIndex = Random().nextInt(_lootList.length);
      setState(() {
        _selectedLoot = _lootList[randomIndex];
      });
    }
  }

  // Widget to display the image and details of selected loot
  Widget buildLootDisplay() {
    if (_selectedLoot == null) {
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
        Image.asset(
          _selectedLoot!['imagePath'] as String,
          height: 80,
        ),
        Text("Name: ${_selectedLoot!['name']}"),
        Text("Class: ${_selectedLoot!['class']}"),
        Text("Level: ${_selectedLoot!['level']}"),
        Text("Attribute: ${_selectedLoot!['attribute']}"),
      ],
    );
  }

  // Widget to build the loot tier selector UI
  Widget buildTierSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.white,
          ),
          onPressed: () => changeLootTier(-1),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "$_lootTier",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            // const SizedBox(height: 8),
            const Text(
              "Loot Tier",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          onPressed: () => changeLootTier(1),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: generateRandomLoot,
          child: const Text("Generate Loot"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      buildLootDisplay(), // Show either placeholder or selected loot
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Loot tier selector and randomize button
              buildTierSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
