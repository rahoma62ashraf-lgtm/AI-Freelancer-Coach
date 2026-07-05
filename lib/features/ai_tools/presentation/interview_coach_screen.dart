import 'package:flutter/material.dart';

class InterviewCoachScreen extends StatelessWidget {
  const InterviewCoachScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interview Coach')),
      body: const Center(
        child: Text(
          '🎙️ Simulate technical interviews with voice/text feedback.',
        ),
      ),
    );
  }
}
