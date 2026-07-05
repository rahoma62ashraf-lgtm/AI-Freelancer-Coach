import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'daily_missions_screen.dart';
import 'progress_screen.dart';
import 'achievements_screen.dart';
import '../../ai_tools/presentation/project_ideas_screen.dart';
import '../../ai_tools/presentation/freelance_platforms_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'AI Career Hub ✨',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildFeatureCard(
            context,
            'Daily Missions 🎯',
            'Complete tasks to earn points',
            const DailyMissionsScreen(),
          ),
          _buildFeatureCard(
            context,
            'Progress & Statistics 📈',
            'Track your skills growth',
            const ProgressScreen(),
          ),
          _buildFeatureCard(
            context,
            'AI Project Ideas 💡',
            'Generate tailor-made project briefs',
            const ProjectIdeasScreen(),
          ),
          _buildFeatureCard(
            context,
            'Freelance Platforms 🚀',
            'Guide to land remote gigs',
            const FreelancePlatformsScreen(),
          ),
          _buildFeatureCard(
            context,
            'My Achievements 🏆',
            'View badges and certificates',
            const AchievementsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String desc,
    Widget nextScreen,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => nextScreen),
        ),
      ),
    );
  }
}
