import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:dice_dungeons_eight/view_model/enemy_model.dart';

class EnemyViewModel extends ChangeNotifier {
  int _enemyTier = 1;
  List _enemyList = [];
  Enemy? _selectedEnemy;
  final List _addedEnemies = [];

  int get enemyTier => _enemyTier;
  List get enemyList => _enemyList;
  Enemy? get selectedEnemy => _selectedEnemy;
  int get addedCount => _addedEnemies.length;
  List get addedEnemies => List.unmodifiable(_addedEnemies);

  EnemyViewModel() {
    loadEnemyJson();
  }

  Future loadEnemyJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/enemies.json');
    final Map jsonData = json.decode(jsonString);
    final List tierData = jsonData['tier$_enemyTier'] ?? [];
    _enemyList = tierData.map((item) => Enemy.fromJson(item)).toList();
    notifyListeners();
  }

  void changeEnemyTier(int delta) async {
    final int newTier = _enemyTier + delta;
    if (newTier >= 1 && newTier <= 3) {
      _enemyTier = newTier;
      _selectedEnemy = null;
      await loadEnemyJson();
    }
  }

  void generateRandomEnemy() {
    if (_enemyList.isNotEmpty) {
      final int randomIndex = Random().nextInt(_enemyList.length);
      _selectedEnemy = _enemyList[randomIndex];
      notifyListeners();
    }
  }

  // Adds the currently selected enemy to a local collection. Returns true if added.
  bool addCurrentEnemy() {
    if (_selectedEnemy == null) return false;
    _addedEnemies.add(_selectedEnemy!);
    notifyListeners();
    return true;
  }
}
