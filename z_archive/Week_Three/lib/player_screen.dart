import 'package:flutter/material.dart';
import 'player_model.dart';
import 'gradient_background.dart';

class PlayerScreen extends StatefulWidget {
  final Player player;

  const PlayerScreen({super.key, required this.player});

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
      body: GradientBackground(
        child: PlayerScreenView(
          player: widget.player,
          health: health,
          level: level,
          increaseHealth: increaseHealth,
          decreaseHealth: decreaseHealth,
          increaseLevel: increaseLevel,
          decreaseLevel: decreaseLevel,
        ),
      ),
    );
  }
}

class PlayerScreenView extends StatelessWidget {
  const PlayerScreenView({
    super.key,
    required this.player,
    required this.health,
    required this.level,
    required this.increaseHealth,
    required this.decreaseHealth,
    required this.increaseLevel,
    required this.decreaseLevel,
  });

  final Player player;
  final int health;
  final int level;
  final VoidCallback increaseHealth;
  final VoidCallback decreaseHealth;
  final VoidCallback increaseLevel;
  final VoidCallback decreaseLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          player.image,
          height: 250,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Name: ${player.name}',
                style: const TextStyle(color: Colors.white)),
            Text('Class: ${player.playerClass}',
                style: const TextStyle(color: Colors.white)),
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
            ElevatedButton(onPressed: increaseHealth, child: const Text('HP+')),
            ElevatedButton(onPressed: decreaseHealth, child: const Text('HP-')),
            ElevatedButton(onPressed: increaseLevel, child: const Text('LVL+')),
            ElevatedButton(onPressed: decreaseLevel, child: const Text('LVL-')),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to List'),
        ),
      ],
    );
  }
}
