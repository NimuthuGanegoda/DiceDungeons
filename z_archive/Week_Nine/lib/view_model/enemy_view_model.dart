import 'dart:convert'; // For decoding JSON
import 'dart:math'; // For generating random numbers

import 'package:flutter/services.dart'; // To load assets
import 'package:flutter/foundation.dart'; // For ChangeNotifier

import 'package:dice_dungeons_nine/model/enemy_model.dart';

// ViewModel using ChangeNotifier (this notifies the UI to rebuild)
class EnemyViewModel extends ChangeNotifier {
  int _enemyTier = 1; // The currently selected enemy tier (1, 2, or 3)
  List<EnemyItem> _enemyList = []; // List of enemy items loaded from JSON
  EnemyItem? _selectedEnemy; // The currently displayed enemy
  final List<EnemyItem> _addedEnemies = []; // Enemies added to a temporary list

  // Public getters to allow the UI to read values from the ViewModel
  int get enemyTier => _enemyTier;
  List<EnemyItem> get enemyList => _enemyList;
  EnemyItem? get selectedEnemy => _selectedEnemy;
  int get addedCount => _addedEnemies.length;
  List<EnemyItem> get addedEnemies => List.unmodifiable(_addedEnemies);

  // Constructor that loads JSON on creation and picks a random enemy to show immediately
  EnemyViewModel() {
    loadEnemyJson().then((_) {
      generateRandomEnemy(); // Ensure we show an enemy right away
    });
  }

  // Load enemy JSON from assets and filter by selected tier
  Future<void> loadEnemyJson() async {
    final String jsonString = await rootBundle.loadString('assets/data/enemies.json'); // Load file
    final Map<String, dynamic> jsonData = json.decode(jsonString); // Decode JSON

    // Load the correct tier list or fallback to an empty list
    final List<dynamic> tierData = jsonData['tier$_enemyTier'] ?? [];

    // Convert each map entry to an EnemyItem object
    _enemyList = tierData.map((item) => EnemyItem.fromJson(item)).toList();

    notifyListeners(); // Let the UI know something changed
  }

  // Updates the enemy tier and reloads JSON data
  void changeEnemyTier(int delta) async {
    final int newTier = _enemyTier + delta;

    if (newTier >= 1 && newTier <= 3) {
      _enemyTier = newTier;
      _selectedEnemy = null; // Clear previous enemy selection
      await loadEnemyJson(); // Reload data
    }
  }

  // Select a random enemy from the list
  void generateRandomEnemy() {
    if (_enemyList.isNotEmpty) {
      final int randomIndex = Random().nextInt(_enemyList.length);
      _selectedEnemy = _enemyList[randomIndex];
      notifyListeners(); // Let UI know to redraw with new selection
    }
  }

  // Add the currently selected enemy to the local added list
  bool addCurrentEnemy() {
    if (_selectedEnemy == null) return false;
    _addedEnemies.add(_selectedEnemy!);
    notifyListeners();
    return true;
  }
}
