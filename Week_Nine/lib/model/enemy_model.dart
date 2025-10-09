// Represents a single enemy with name, class, level, attack strength, and image path.
class EnemyItem {
  final String name;
  final String imagePath;
  final String enemyClass;
  final int level;
  final int attackStrength;

  EnemyItem({
    required this.name,
    required this.imagePath,
    required this.enemyClass,
    required this.level,
    required this.attackStrength,
  });

  // Factory constructor to create an EnemyItem instance from a JSON map
  factory EnemyItem.fromJson(Map<String, dynamic> json) {
    return EnemyItem(
      name: json['name'],
      imagePath: json['imagePath'],
      enemyClass: json['class'], // Maps 'class' field from JSON
      level: json['level'],
      attackStrength: json['attackStrength'],
    );
  }
}
