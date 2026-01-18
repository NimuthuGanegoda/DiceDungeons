import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:dice_dungeons_seven/view_model/enemy_model.dart';

class EnemyViewModel extends ChangeNotifier {
  int _enemyTier = 1;
  List _enemyList = [];
  Enemy? _selectedEnemy;

  int get enemyTier => _enemyTier;
  List get enemyList => _enemyList;
  Enemy? get selectedEnemy => _selectedEnemy;

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
}
