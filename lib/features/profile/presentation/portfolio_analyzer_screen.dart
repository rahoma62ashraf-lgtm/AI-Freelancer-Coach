import 'package:flutter/material.dart';

class PortfolioAnalyzerScreen extends StatelessWidget {
  const PortfolioAnalyzerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio Analyzer')),
      body: const Center(
        child: Text(
          '🔗 Enter GitHub link to audit repositories and clean code standards.',
        ),
      ),
    );
  }
}
