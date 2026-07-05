import 'package:flutter/material.dart';

class ProjectIdeasScreen extends StatelessWidget {
  const ProjectIdeasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Project Ideas')),
      body: const Center(
        child: Text(
          '💡 Custom startup project concepts to build your portfolio.',
        ),
      ),
    );
  }
}
