import 'dart:convert'; // For decoding JSON
import 'dart:math'; // For generating random numbers

import 'package:flutter/services.dart'; // To load assets
import 'package:flutter/foundation.dart'; // For ChangeNotifier

import 'package:dice_dungeons_nine/model/loot_model.dart'; // Our loot item model

// ViewModel using ChangeNotifier (this notifies the UI to rebuild)
class LootViewModel extends ChangeNotifier {
  int _lootTier = 1; // The currently selected loot tier (1, 2, or 3)
  List _lootList = []; // List of loot items loaded from JSON
  LootItem? _selectedLoot; // The currently displayed loot item

  int get lootTier => _lootTier;
  List get lootList => _lootList;
  LootItem? get selectedLoot => _selectedLoot;

  LootViewModel() {
    loadLootJson(); // Load loot data on init
  }

  // Load loot JSON from assets and filter by selected tier
  // This future function will give you a result in the future, not immediately.
  Future loadLootJson() async {
    // This function will run asynchronously (in the background), and it may take time (like reading a file or downloading data)."
    final String jsonString =
        await rootBundle.loadString('assets/data/loot.json'); // Load file
    // Wait here until the background task finishes, then continue.
    final Map jsonData = json.decode(jsonString); // Decode JSON

    // ?? [] means, that if there’s no data for this tier (e.g. it doesn’t exist), then just use an empty list [] instead."
    final List tierData =
        jsonData['tier$_lootTier'] ?? []; // Fallback to empty list
    _lootList = tierData.map((item) => LootItem.fromJson(item)).toList();

    notifyListeners(); // Tell UI to rebuild, we originally called set state, but we are using provider
  }

  // Updates the loot tier by a delta (e.g., -1 or +1)
  void changeLootTier(int delta) async {
    final int newTier = _lootTier + delta;

    if (newTier >= 1 && newTier <= 3) {
      _lootTier = newTier;
      _selectedLoot = null; // Clear previous loot
      await loadLootJson(); // Reload data for new tier
    }
  }

  // Selects a random loot item from the current tier's list
  void generateRandomLoot() {
    if (_lootList.isNotEmpty) {
      final int randomIndex = Random().nextInt(_lootList.length);
      _selectedLoot = _lootList[randomIndex];
      notifyListeners(); // Update UI
    }
  }
}
