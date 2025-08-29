// This imports the Flutter Material package, which gives us access
// to pre-built widgets like MaterialApp, Scaffold, AppBar, Text, etc.
import 'package:flutter/material.dart';
import 'dart:math';

// Character class to store character information
class Character {
  String name;
  int health;
  int maxHealth;
  int armorClass;
  int level;

  Character({
    required this.name,
    required this.health,
    required this.maxHealth,
    required this.armorClass,
    required this.level,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice & Dungeons Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DiceAndDungeonsHome(),
    );
  }
}

class DiceAndDungeonsHome extends StatefulWidget {
  const DiceAndDungeonsHome({super.key});

  @override
  State<DiceAndDungeonsHome> createState() => _DiceAndDungeonsHomeState();
}

class _DiceAndDungeonsHomeState extends State<DiceAndDungeonsHome> {
  int diceResult = 1;
  int selectedDiceType = 20; // Default to d20
  List<int> diceHistory = [];
  List<Character> characters = [];
  final Random _random = Random();

  // Dice rolling function
  void rollDice() {
    setState(() {
      diceResult = _random.nextInt(selectedDiceType) + 1;
      diceHistory.insert(0, diceResult);
      if (diceHistory.length > 10) {
        diceHistory.removeLast();
      }
    });
  }

  // Add new character
  void addCharacter() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        int health = 10;
        int armorClass = 10;
        int level = 1;

        return AlertDialog(
          title: const Text('Add New Character'),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Character Name',
                    ),
                    onChanged: (value) => name = value,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Health'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => health = int.tryParse(value) ?? 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Armor Class'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        armorClass = int.tryParse(value) ?? 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Level'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => level = int.tryParse(value) ?? 1,
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  setState(() {
                    characters.add(
                      Character(
                        name: name,
                        health: health,
                        maxHealth: health,
                        armorClass: armorClass,
                        level: level,
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Update character health
  void updateCharacterHealth(int index, int change) {
    setState(() {
      characters[index].health = (characters[index].health + change).clamp(
        0,
        characters[index].maxHealth,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 206, 51, 51),
              Color.fromARGB(255, 45, 7, 98),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Title
                const Text(
                  'Dice & Dungeons Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Dice Rolling Section
                Card(
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Dice Roller',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Dice type selector
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [4, 6, 8, 10, 12, 20, 100].map((diceType) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedDiceType == diceType
                                    ? Colors.deepPurple
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedDiceType = diceType;
                                });
                              },
                              child: Text('d$diceType'),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),

                        // Dice result display
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '$diceResult',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Roll button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                          onPressed: rollDice,
                          child: const Text(
                            'ROLL DICE',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        // Dice history
                        if (diceHistory.isNotEmpty) ...[
                          const SizedBox(height: 20),
                          const Text(
                            'Recent Rolls:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            children: diceHistory.map((roll) {
                              return Chip(
                                label: Text('$roll'),
                                backgroundColor: Colors.deepPurple.withOpacity(
                                  0.2,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Character Tracker Section
                Card(
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Character Tracker',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: addCharacter,
                              child: const Text(
                                'Add Character',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Characters list
                        if (characters.isEmpty)
                          const Text(
                            'No characters added yet. Click "Add Character" to get started!',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          )
                        else
                          ...characters.asMap().entries.map((entry) {
                            int index = entry.key;
                            Character character = entry.value;

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          character.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              characters.removeAt(index);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text('Level: ${character.level}'),
                                        const SizedBox(width: 20),
                                        Text('AC: ${character.armorClass}'),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Health: ${character.health}/${character.maxHealth}',
                                          style: TextStyle(
                                            color:
                                                character.health <=
                                                    character.maxHealth * 0.3
                                                ? Colors.red
                                                : character.health <=
                                                      character.maxHealth * 0.6
                                                ? Colors.orange
                                                : Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                minimumSize: const Size(40, 30),
                                              ),
                                              onPressed: () =>
                                                  updateCharacterHealth(
                                                    index,
                                                    -1,
                                                  ),
                                              child: const Text(
                                                '-1',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                minimumSize: const Size(40, 30),
                                              ),
                                              onPressed: () =>
                                                  updateCharacterHealth(
                                                    index,
                                                    -5,
                                                  ),
                                              child: const Text(
                                                '-5',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                minimumSize: const Size(40, 30),
                                              ),
                                              onPressed: () =>
                                                  updateCharacterHealth(
                                                    index,
                                                    1,
                                                  ),
                                              child: const Text(
                                                '+1',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                minimumSize: const Size(40, 30),
                                              ),
                                              onPressed: () =>
                                                  updateCharacterHealth(
                                                    index,
                                                    5,
                                                  ),
                                              child: const Text(
                                                '+5',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Health bar
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(
                                      value:
                                          character.health /
                                          character.maxHealth,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        character.health <=
                                                character.maxHealth * 0.3
                                            ? Colors.red
                                            : character.health <=
                                                  character.maxHealth * 0.6
                                            ? Colors.orange
                                            : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This is the entry point of the Flutter app.
// The 'main' function runs first when the app starts.
void main() {
  // runApp is a built-in Flutter function that takes a widget
  // and makes it the root of the app.
  runApp(const MyApp());
}
