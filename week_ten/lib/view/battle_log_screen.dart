import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dice_dungeons_ten/view_model/battle_log_view_model.dart';
import 'package:dice_dungeons_ten/gradient_background.dart';

class BattleLogScreen extends StatelessWidget {
  const BattleLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logViewModel = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Logo at the top
              Image.asset('assets/images/logo.png'),

              // Back button + title row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    const Text(
                      'Battle Log',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Log list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: logViewModel.logs.length,
                  itemBuilder: (context, index) {
                    final entry = logViewModel.logs[index];
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text("Date: ${entry.timestamp}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Location: ${entry.location}"),
                            Text("Event: ${entry.description}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // FAB to open entry form
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 97, 0, 73),
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddLogDialog(context, logViewModel);
        },
      ),
    );
  }

  // Helper method to show a dialog for entering a log event
  void _showAddLogDialog(BuildContext context, BattleLogViewModel logViewModel) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('New Battle Event'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Describe what happened...'),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                logViewModel.addLog(text);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}