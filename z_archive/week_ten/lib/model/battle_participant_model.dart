// Represents a participant in our battle screen with name, attack strength, health, and image path.
import 'package:uuid/uuid.dart';

class BattleParticipant {
  final String id; // New unique ID
  final String name;
  final String imagePath;
  final int attack;
  int health;

  BattleParticipant({
    required this.name,
    required this.imagePath,
    required this.attack,
    required this.health,
  }) : id = Uuid().v4(); // create a unique id here
}
