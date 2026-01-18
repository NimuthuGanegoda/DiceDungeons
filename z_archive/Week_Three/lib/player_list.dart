import 'package:flutter/material.dart';
import 'player_model.dart';
import 'player_screen.dart';
import 'gradient_background.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players = [
    Player(
        name: 'Player One',
        playerClass: 'Warrior',
        image: 'assets/images/player.png'),
    Player(
        name: 'BIG BOY',
        playerClass: 'Mage',
        image: 'assets/images/player_two.png'),
  ];

  PlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: PlayerListView(players: players),
      ),
    );
  }
}

class PlayerListView extends StatelessWidget {
  const PlayerListView({
    super.key,
    required this.players,
  });

  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          'Dice and Dungeons!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(120, 45, 10, 60),
                child: ListTile(
                  leading: Image.asset(players[index].image, width: 50),
                  title: Text(
                    players[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    players[index].playerClass,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlayerScreen(player: players[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
