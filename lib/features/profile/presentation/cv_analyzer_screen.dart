import 'package:flutter/material.dart';

class CvAnalyzerScreen extends StatelessWidget {
  const CvAnalyzerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CV ATS Scanner')),
      body: const Center(
        child: Text('📄 Upload your CV to check your ATS compatibility score.'),
      ),
    );
  }
}
