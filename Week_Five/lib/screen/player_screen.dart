import 'package:flutter/material.dart';
import '../model/player_model.dart';
import '../gradient_background.dart';

class PlayerScreen extends StatefulWidget {
  final Player player;
  const PlayerScreen({super.key, required this.player});

  @override
  State createState() {
    return _PlayerScreenState();
  }
}

class _PlayerScreenState extends State<PlayerScreen> {
  late int health;
  late int level;

  @override
  void initState() {
    super.initState();
    health = widget.player.health;
    level = widget.player.level;
  }

  void increaseHealth() {
    setState(() {
      health++;
    });
  }

  void decreaseHealth() {
    setState(() {
      health--;
    });
  }

  void increaseLevel() {
    setState(() {
      level++;
    });
  }

  void decreaseLevel() {
    setState(() {
      level--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dice and Dungeons!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Image.asset(widget.player.imagePath, height: 200),
            const SizedBox(height: 20),
            Text('Name: ${widget.player.name}',
                style: const TextStyle(color: Colors.white)),
            Text('Class: ${widget.player.className}',
                style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Text('Health: $health',
                style: const TextStyle(color: Colors.white)),
            Text('Level: $level', style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: increaseHealth, child: const Text('HP+')),
                ElevatedButton(
                    onPressed: decreaseHealth, child: const Text('HP-')),
                ElevatedButton(
                    onPressed: increaseLevel, child: const Text('Lvl+')),
                ElevatedButton(
                    onPressed: decreaseLevel, child: const Text('Lvl-')),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
