
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All In One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All In One'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final week = index + 1;
          return ListTile(
            title: Text('Week $week'),
            onTap: () {
              // TODO: Navigate to the corresponding week's app
            },
          );
        },
      ),
    );
  }
}
