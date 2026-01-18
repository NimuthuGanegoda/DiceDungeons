// Import Dart and Flutter libraries for file I/O, location, JSON, and state management
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:dice_dungeons_ten/model/battle_log_model.dart';

// This ViewModel manages the list of battle log entries and handles logic for saving/loading them
class BattleLogViewModel extends ChangeNotifier {
  // Internal list of logs (private to prevent direct access)
  final List _logs = [];

  // Public getter for logs (read-only from outside)
  List get logs => List.unmodifiable(_logs);

  // Public method to add a log entry by calling the internal async method
  void addEntry(String description) {
    _buildAndAddEntry(description);
  }

  // Builds a new log entry with GPS + timestamp
  Future _buildAndAddEntry(String description) async {
    try {
      // Get the current GPS location
      final position = await Geolocator.getCurrentPosition();

      // Convert GPS coordinates to a human readable suburb name
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final suburb = placemarks.first.subLocality ?? 'Unknown';

      // Create a new BattleLog instance
      final entry = BattleLog(
        id: Uuid().v4(), // Generate unique ID
        timestamp: DateTime.now().toIso8601String(),
        location: suburb,
        description: description,
      );

      // Add to list and notify listeners (UI will update)
      _logs.add(entry);
      notifyListeners();

      // Persist to disk
      await saveLogsToDisk();
    } catch (e) {
      // Print any location-related error
      debugPrint('Error getting location: $e');
    }
  }

  // Another version of the add method with location permission checking built-in
  Future addLog(String description) async {
    final id = const Uuid().v4();
    final now = DateTime.now().toIso8601String();

    // Check if location service is enabled on device
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    // Check and request location permission if needed
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return; // Cannot continue without permission
      }
    }

    // Get user's current position
    final position = await Geolocator.getCurrentPosition();

    // Convert lat/long into a readable place name (suburb)
    final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    final suburb = placemarks.isNotEmpty ? placemarks.first.locality ?? "Unknown" : "Unknown";

    // Create a new log entry
    final newLog = BattleLog(
      id: id,
      timestamp: now,
      location: suburb,
      description: description,
    );

    // Add log and notify UI
    _logs.add(newLog);
    await saveLogsToDisk();
    notifyListeners();
  }

  // Converts all logs to JSON and saves them in a local file
  Future saveLogsToDisk() async {
    final file = await _localFile;
    final jsonString = jsonEncode(_logs.map((log) => log.toJson()).toList());
    await file.writeAsString(jsonString);
  }

  // Loads saved logs from disk and restores them to memory
  Future loadLogsFromDisk() async {
    final file = await _localFile;

    // If file doesn't exist, create a blank JSON file
    if (!await file.exists()) {
      await file.writeAsString(jsonEncode([]));
      return;
    }

    // Read JSON string from file
    final jsonString = await file.readAsString();

    // Parse JSON and convert into BattleLog objects
    final jsonData = jsonDecode(jsonString) as List;
    _logs.clear();
    _logs.addAll(jsonData.map((e) => BattleLog.fromJson(e)));

    // Notify UI that logs have been updated
    notifyListeners();
  }

  // Gets a reference to the file used to store battle logs
  Future get _localFile async {
    // Get the app's documents directory
    final dir = await getApplicationDocumentsDirectory();

    // Define file path
    final file = File('${dir.path}/battle_logs.json');

    // Create file if it doesn't exist
    if (!await file.exists()) {
      await file.create(recursive: true);
      await file.writeAsString('[]');
    }

    return file;
  }
}