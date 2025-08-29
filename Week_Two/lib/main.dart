import 'package:flutter/material.dart';
import 'player.dart';

void main() {
  runApp(MaterialApp(home: PlayerScreen(), debugShowCheckedModeBanner: false));
}

class DiceProfilePage extends StatefulWidget {
  const DiceProfilePage({super.key});

  @override
  _DiceProfilePageState createState() => _DiceProfilePageState();
}

class _DiceProfilePageState extends State {
  int health = 10;
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent background allows gradient to show through
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 247, 42, 76), // Red
              Color.fromARGB(255, 97, 0, 73), // Dark purple
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dice and Dungeons!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
              ),
              SizedBox(height: 20),

              // Character image
              Image.asset('assets/images/player.png', height: 40),

              SizedBox(height: 20),

              // Name and Class
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Name: You', style: TextStyle(color: Colors.white)),
                    Text('Class: Human', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Health and Level with buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Health: $health',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => setState(() => health++),
                              child: Text('HP+'),
                            ),
                            SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () => setState(() => health--),
                              child: Text('HP-'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Level: $level',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => setState(() => level++),
                              child: Text('Lvl+'),
                            ),
                            SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () => setState(() => level--),
                              child: Text('Lvl-'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
