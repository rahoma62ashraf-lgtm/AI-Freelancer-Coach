import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'cv_analyzer_screen.dart';
import 'portfolio_analyzer_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Center(
            child: Text(
              'Rahma\nComputer Science Student',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CvAnalyzerScreen()),
            ),
            child: const Text('ATS CV Analyzer'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PortfolioAnalyzerScreen(),
              ),
            ),
            child: const Text('GitHub Portfolio Analyzer'),
          ),
        ],
      ),
    );
  }
}
