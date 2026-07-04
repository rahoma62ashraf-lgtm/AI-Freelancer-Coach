import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'ai_assessment_screen.dart';

class ChooseTrackScreen extends StatefulWidget {
  const ChooseTrackScreen({super.key});

  @override
  State<ChooseTrackScreen> createState() => _ChooseTrackScreenState();
}

class _ChooseTrackScreenState extends State<ChooseTrackScreen> {
  String? _selectedTrack;
  String? _selectedLevel;

  final List<Map<String, dynamic>> _tracks = [
    {'name': 'Computer Science / Mobile Dev', 'icon': Icons.phone_android},
    {'name': 'UI/UX Design (Material 3)', 'icon': Icons.design_services},
    {'name': 'Full-Stack Web Developer', 'icon': Icons.code},
  ];

  final List<String> _levels = [
    'Beginner',
    'Intermediate',
    'Senior / Advanced',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tailor Your AI Coach',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select your track and current expertise level.',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),

              const Text(
                '1. Choose Technical Track',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _tracks.length,
                  itemBuilder: (context, index) {
                    final track = _tracks[index];
                    final isSelected = _selectedTrack == track['name'];
                    return Card(
                      color: isSelected ? Colors.indigo.shade50 : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Icon(
                          track['icon'],
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        title: Text(
                          track['name'],
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        onTap: () =>
                            setState(() => _selectedTrack = track['name']),
                      ),
                    );
                  },
                ),
              ),

              const Text(
                '2. Select Your Level',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: _levels.map((level) {
                  final isSelected = _selectedLevel == level;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedLevel = level),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          level,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textDark,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),

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
                  onPressed: (_selectedTrack != null && _selectedLevel != null)
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AiAssessmentScreen(),
                          ),
                        )
                      : null,
                  child: const Text(
                    'Start AI Assessment',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
