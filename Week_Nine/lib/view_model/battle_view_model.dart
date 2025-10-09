import 'package:flutter/foundation.dart';
import 'package:dice_dungeons_nine/model/battle_participant_model.dart';

// ViewModel that manages the list of active participants in battle.
// Notifies the UI whenever this list changes.
class BattleViewModel extends ChangeNotifier {
  // Private list to store current participants in the battle.
  final List<BattleParticipant> _participants = [];

  // Public getter that returns an unmodifiable view of the participant list.
  // This ensures the UI can read the list but not change it directly.
  List<BattleParticipant> get participants => List.unmodifiable(_participants);

  // Add a new enemy or participant to the battle list.
  // This is typically called when an enemy is selected from the enemy screen.
  void addEnemy(BattleParticipant enemy) {
    _participants.add(enemy);
    notifyListeners(); // Trigger a UI rebuild
  }

  // Remove a participant from the list by index.
  // Used when a participant is dismissed (e.g., swiped away).
  void removeParticipant(int index) {
    if (index >= 0 && index < _participants.length) {
      _participants.removeAt(index);
      notifyListeners(); // Trigger a UI rebuild
    }
  }

  // Change a participant's health by a given amount (delta).
  // If health drops to 0, the participant is automatically removed.
  void changeHealth(int index, int delta) {
    if (index >= 0 && index < _participants.length) {
      _participants[index].health += delta;

      // Automatically remove participant if their health reaches 0
      if (_participants[index].health <= 0) {
        _participants[index].health = 0;
        removeParticipant(index);
      } else {
        notifyListeners(); // Trigger a UI rebuild
      }
    }
  }

  // Randomly shuffle the order of all participants in the list.
  // Can be used to simulate initiative or random turn order.
  void shuffleTurnOrder() {
    _participants.shuffle();
    notifyListeners(); // Trigger a UI rebuild
  }

  // Clears all participants from the current battle.
  void clearBattle() {
    _participants.clear();
    notifyListeners(); // Trigger a UI rebuild
  }

  // Remove a participant by reference (safer with Dismissible/ObjectKey)
  void removeParticipantRef(BattleParticipant participant) {
    final idx = _participants.indexOf(participant);
    if (idx != -1) {
      _participants.removeAt(idx);
      notifyListeners();
    }
  }
}
