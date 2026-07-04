import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'ai_analysis_screen.dart';

class AiAssessmentScreen extends StatefulWidget {
  const AiAssessmentScreen({super.key});

  @override
  State<AiAssessmentScreen> createState() => _AiAssessmentScreenState();
}

class _AiAssessmentScreenState extends State<AiAssessmentScreen> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;

  final List<Map<String, dynamic>> _questions = [
    {
      'q':
          'How do you structure your Flutter applications for complex enterprise scalability?',
      'answers': [
        'Clean Architecture / Features-first',
        'Everything inside main.dart',
        'MVC basic folders',
        'StatefulWidgets only',
      ],
    },
    {
      'q':
          'What is your primary method for handling responsive layout design across platforms?',
      'answers': [
        'LayoutBuilder & MediaQuery',
        'Hardcoded width/height pixel constraints',
        'Expanded widgets exclusively',
        'Using 3rd party static plugins',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    double progress = (_currentQuestionIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade200,
                color: AppColors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              Text(
                currentQuestion['q'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: currentQuestion['answers'].length,
                  itemBuilder: (context, index) {
                    final answer = currentQuestion['answers'][index];
                    final isSelected = _selectedAnswer == answer;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          answer,
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: isSelected
                            ? const Icon(
                                Icons.check_circle,
                                color: AppColors.primary,
                              )
                            : null,
                        onTap: () => setState(() => _selectedAnswer = answer),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _selectedAnswer != null ? _onNextPressed : null,
                  child: Text(
                    _currentQuestionIndex == _questions.length - 1
                        ? 'Submit Assessment'
                        : 'Next Question',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onNextPressed() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AiAnalysisScreen()),
      );
    }
  }
}
