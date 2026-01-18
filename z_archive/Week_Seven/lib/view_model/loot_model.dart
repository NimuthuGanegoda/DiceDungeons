  
// Represents a single loot item with name, class, level, and attribute.
class LootItem {
  final String name;
  final String imagePath;
  final String itemClass;
  final int level;
  final String attribute;

  LootItem({
    required this.name,
    required this.imagePath,
    required this.itemClass,
    required this.level,
    required this.attribute,
  });

  // Factory constructor to create from JSON
  factory LootItem.fromJson(Map json) {
    return LootItem(
      name: json['name'],
      imagePath: json['imagePath'],
      itemClass: json['class'],
      level: json['level'],
      attribute: json['attribute'],
    );
  }
}
