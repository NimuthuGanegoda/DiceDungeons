import 'package:dice_dungeons_ten/view_model/battle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TurnOrderList extends StatelessWidget {
  const TurnOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final battleViewModel = Provider.of<BattleViewModel>(context);

    return ListView.builder(
      itemCount: battleViewModel.participants.length,
      itemBuilder: (context, index) {
        final participant = battleViewModel.participants[index];

        return Dismissible(
          key: Key(participant.id),
          onDismissed: (_) {
            battleViewModel.removeParticipant(participant.id);
          },
          // background: Container(color: Colors.red),
          child: Card(
            shadowColor: Colors.black,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(participant.imagePath)),
              title: Text(
                participant.name,
                style: TextStyle(
                  color: Color.fromARGB(255, 97, 0, 73),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Atk: ${participant.attack}, Health: ${participant.health}',
                style: TextStyle(
                  color: Color.fromARGB(255, 97, 0, 73),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Color.fromARGB(255, 97, 0, 73),
                    ),
                    onPressed: () => battleViewModel.changeHealth(index, -1),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 97, 0, 73),
                    ),
                    onPressed: () => battleViewModel.changeHealth(index, 1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
