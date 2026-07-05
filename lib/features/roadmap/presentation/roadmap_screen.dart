import 'package:flutter/material.dart';
import 'learning_resources_screen.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My AI Roadmap')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Phase 1: Dart Advanced'),
          ),
          const ListTile(
            leading: Icon(Icons.radio_button_unchecked),
            title: Text('Phase 2: Flutter Clean Architecture'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LearningResourcesScreen(),
              ),
            ),
            child: const Text('View Resources'),
          ),
        ],
      ),
    );
  }
}
