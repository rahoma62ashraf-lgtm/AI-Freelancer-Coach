import 'package:flutter/material.dart';

class ProposalGeneratorScreen extends StatelessWidget {
  const ProposalGeneratorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Proposal Generator')),
      body: const Center(
        child: Text(
          '✍️ Paste job details to auto-generate winning freelance proposals.',
        ),
      ),
    );
  }
}
