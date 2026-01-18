// Represents a participant in our battle screen with name, attack strength, health, and image path.
class BattleParticipant {
  final String name;
  final String imagePath;
  final int attack;
  int health;

  BattleParticipant({
    required this.name,
    required this.imagePath,
    required this.attack,
    required this.health,
  });
}
