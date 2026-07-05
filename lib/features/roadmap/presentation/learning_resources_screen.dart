import 'package:flutter/material.dart';

class LearningResourcesScreen extends StatelessWidget {
  const LearningResourcesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning Resources')),
      body: const Center(
        child: Text('📚 Recommended books, courses, and documentations.'),
      ),
    );
  }
}
