import 'package:flutter/material.dart';
import 'interview_coach_screen.dart';
import 'proposal_generator_screen.dart';

class AiCoachScreen extends StatelessWidget {
  const AiCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Career Coach')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Card(
            child: ListTile(
              title: Text('Chat with AI Mentor'),
              subtitle: Text('Ask technical or career questions.'),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InterviewCoachScreen()),
            ),
            child: const Text('Mock Interview Simulator'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProposalGeneratorScreen(),
              ),
            ),
            child: const Text('Proposal Generator'),
          ),
        ],
      ),
    );
  }
}
