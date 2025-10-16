// This class defines the data model for a single battle log entry
class BattleLog {
  // Each log entry has a unique IDm, generated using Uuid
  final String id;

  // Timestamp when the event was logged, stored as a String
  final String timestamp;

  // The human-readable location, where the event was logged, we will use the suburb
  final String location;

  // The description of the event, which will be user-provided text
  final String description;

  // Constructor to create a BattleLog object, with all fields required
  BattleLog({
    required this.id,
    required this.timestamp,
    required this.location,
    required this.description,
  });

  // Converts a BattleLog object to a JSON-compatible Map
  // This is used when saving logs to disk as JSON
  Map toJson() => {
        'id': id,
        'timestamp': timestamp,
        'location': location,
        'description': description,
      };

  // Factory constructor to create a BattleLog object from JSON data (Map)
  // This is used when loading logs from disk
  factory BattleLog.fromJson(Map json) => BattleLog(
        id: json['id'],
        timestamp: json['timestamp'],
        location: json['location'],
        description: json['description'],
      );
}