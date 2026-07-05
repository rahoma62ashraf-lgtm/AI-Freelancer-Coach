import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'ai_analysis_screen.dart';

class AiAssessmentScreen extends StatefulWidget {
  const AiAssessmentScreen({super.key});

  @override
  State<AiAssessmentScreen> createState() => _AiAssessmentScreenState();
}

class _AiAssessmentScreenState extends State<AiAssessmentScreen> {
  int _currentQuestion = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the purpose of a StatefulWidget in Flutter?',
      'options': [
        'To build static UI',
        'To manage mutable state',
        'To handle HTTP requests',
        'To design themes',
      ],
    },
    {
      'question':
          'Which architecture pattern separates business logic from UI?',
      'options': ['MVC', 'MVVM', 'Clean Architecture / BLoC', 'Monolithic'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestion + 1) / _questions.length,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Question ${_currentQuestion + 1}/${_questions.length}',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            Text(
              _questions[_currentQuestion]['question'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 32),
            ...(_questions[_currentQuestion]['options'] as List<String>).map((
              option,
            ) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentQuestion < _questions.length - 1) {
                      setState(() => _currentQuestion++);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AiAnalysisScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.textDark,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Text(option, style: const TextStyle(fontSize: 15)),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
