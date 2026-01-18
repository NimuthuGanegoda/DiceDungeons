// Import Flutter's material library for widgets and theming
import 'package:flutter/material.dart';

// Import the Player model so we can create new player instances
import 'package:dice_dungeons_five/model/player_model.dart';

// Import the custom gradient background widget
import 'package:dice_dungeons_five/gradient_background.dart';

// This screen allows the user to create a new player.
// It's stateful because the form needs to store user input.
class CreatePlayerScreen extends StatefulWidget {
  const CreatePlayerScreen({super.key});

  // We return the state.
  @override
  State<CreatePlayerScreen> createState() {
    return _CreatePlayerScreenState();
  }
}

class _CreatePlayerScreenState extends State<CreatePlayerScreen> {
  // GlobalKey gives us access to the form's state
  final _formKey = GlobalKey<FormState>();

  // These variables store the form data once saved
  String _name = '';
  String _className = '';
  int _health = 10;
  int _level = 1;

  // This function validates and saves the form, then creates a Player
  void _submitForm() {
    // First, check if all form fields pass validation
    if (_formKey.currentState!.validate()) {
      // If valid, call onSave for each form field
      _formKey.currentState!.save();

      // Create a new Player using the collected input
      final newPlayer = Player(
        name: _name,
        className: _className,
        health: _health,
        level: _level,
        imagePath: 'assets/images/player.png', // Static for now
      );

      // Close the form screen and return the new player to the previous screen
      Navigator.pop(context, newPlayer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent to allow the custom gradient to show
      backgroundColor: Colors.transparent,

      // Use the reusable gradient background
      body: GradientBackground(
        // SafeArea avoids notches/status bar
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20), // Add padding around the form
            child: Form(
              key: _formKey, // Assign the key to the form

              // ListView allows scrolling if the keyboard overlaps the form
              child: ListView(
                children: [
                  // Heading Text
                  const Text(
                    'Create New Player',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Text field for Player Name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onSaved: (value) => _name = value!.trim(),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                  ),

                  const SizedBox(height: 10),

                  // Text field for Class Name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Class',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onSaved: (value) => _className = value!.trim(),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a class' : null,
                  ),

                  const SizedBox(height: 10),

                  // Text field for Health
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Health',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    onSaved: (value) => _health = int.tryParse(value!) ?? 10,
                  ),

                  const SizedBox(height: 10),

                  // Text field for Level
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Level',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    onSaved: (value) => _level = int.tryParse(value!) ?? 1,
                  ),

                  const SizedBox(height: 30),

                  // Submit button to trigger validation and form submission
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Add Player'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
