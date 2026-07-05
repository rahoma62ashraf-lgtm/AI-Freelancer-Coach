import 'package:flutter/material.dart';

class FreelancePlatformsScreen extends StatelessWidget {
  const FreelancePlatformsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Freelance Platforms')),
      body: const Center(
        child: Text(
          '💼 Guide & tips for platforms like Nafathly, Upwork, and Freelancer.',
        ),
      ),
    );
  }
}
