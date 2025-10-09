/// Represents a single enemy with name, image, type/class, level, and attribute.
class Enemy {
  final String name;
  final String imagePath;
  final String enemyType; // e.g. "Beast", "Undead", "Boss", etc.
  final int level;
  final String attribute; // e.g. "Fire", "Poison", "Magic", etc.

  Enemy({
    required this.name,
    required this.imagePath,
    required this.enemyType,
    required this.level,
    required this.attribute,
  });

  /// Factory constructor to create an Enemy from a JSON map.
  factory Enemy.fromJson(Map<String, dynamic> json) {
    return Enemy(
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      enemyType:
          json['type'] as String? ?? json['class'] as String? ?? "Unknown",
      level: json['level'] is int
          ? json['level']
          : int.tryParse(json['level'].toString()) ?? 1,
      attribute: json['attribute'] as String? ?? "None",
    );
  }

  /// Converts this Enemy to a JSON map.
  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
        'type': enemyType,
        'level': level,
        'attribute': attribute,
      };
}
