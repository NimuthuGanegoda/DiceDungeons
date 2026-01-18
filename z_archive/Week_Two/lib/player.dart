// Import the Flutter Material package that provides ready-to-use Material Design widgets.
import 'package:flutter/material.dart';

// Define a stateless widget for the PlayerScreen.
// Since there's no dynamic data here (yet), we use StatelessWidget.
// This widget represents the entire character profile screen.
class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int health = 10;
  int level = 1;

  void increaseHealth() {
    setState(() {
      health++;
    });
  }

  void decreaseHealth() {
    setState(() {
      if (health > 0) health--;
    });
  }

  void increaseLevel() {
    setState(() {
      level++;
    });
  }

  void decreaseLevel() {
    setState(() {
      if (level > 1) level--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 247, 42, 76),
              Color.fromARGB(255, 97, 0, 73),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dice and Dungeons!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/player.png',
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Name: You', style: TextStyle(color: Colors.white)),
                Text('Class: Human', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Health: $health',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Level: $level',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: increaseHealth,
                  child: const Text('HP+'),
                ),
                ElevatedButton(
                  onPressed: decreaseHealth,
                  child: const Text('HP-'),
                ),
                ElevatedButton(
                  onPressed: increaseLevel,
                  child: const Text('Lvl+'),
                ),
                ElevatedButton(
                  onPressed: decreaseLevel,
                  child: const Text('Lvl-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
