import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ActiveRoadmapScreen extends StatelessWidget {
  const ActiveRoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية للـ Roadmap الناتجة من تحليل الـ AI
    final List<Map<String, dynamic>> roadmapSteps = [
      {
        'title': 'Master Material 3 & Responsive Layouts',
        'duration': 'Week 1-2',
        'status': 'done',
        'desc':
            'Deep dive into LayoutBuilder, MediaQuery, and advanced adaptive designs.',
      },
      {
        'title': 'State Management & Clean Architecture',
        'duration': 'Week 3-4',
        'status': 'current',
        'desc': 'Structuring scalable enterprise features-first directories.',
      },
      {
        'title': 'Async Optimization & Backend Integration',
        'duration': 'Week 5-6',
        'status': 'locked',
        'desc':
            'Handling robust API data structures, caching, and background workers.',
      },
      {
        'title': 'Freelance Marketplace Deployment',
        'duration': 'Week 7',
        'status': 'locked',
        'desc':
            'Setting up your Nafathly profile and pitching tools to active clients.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Your AI Active Roadmap',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // كارت علوي ملخص للمستوى الحالي
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Track: Flutter Dev',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Overall Progress: 35% Completed',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Milestones To Success',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),

              // الـ Timeline التفاعلي
              Expanded(
                child: ListView.builder(
                  itemCount: roadmapSteps.length,
                  itemBuilder: (context, index) {
                    final step = roadmapSteps[index];
                    final isDone = step['status'] == 'done';
                    final isCurrent = step['status'] == 'current';

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // العمود الأيسر: الدائرة والخط الواصل (Timeline Line)
                        Column(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: isDone
                                    ? Colors.green
                                    : (isCurrent
                                          ? AppColors.primary
                                          : Colors.grey.shade300),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                isDone
                                    ? Icons.check
                                    : (isCurrent
                                          ? Icons.play_arrow
                                          : Icons.lock),
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                            if (index != roadmapSteps.length - 1)
                              Container(
                                width: 2,
                                height: 80,
                                color: isDone
                                    ? Colors.green
                                    : Colors.grey.shade300,
                              ),
                          ],
                        ),
                        const SizedBox(width: 16),

                        // كارت محتوى الخطوة
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(12),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        step['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: isCurrent
                                              ? AppColors.primary
                                              : AppColors.textDark,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      step['duration'],
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  step['desc'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
