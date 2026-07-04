import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CvAnalyzerScreen extends StatelessWidget {
  // دالة بتوصل من MainNavigationScreen لتغيير التاب الحالي
  // (index 1 = AI Coach Chat) بدل فتح شاشة جديدة فوق الحالية
  final void Function(int index)? onNavigateToTab;

  const CvAnalyzerScreen({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // الشاشة دي أصبحت تاب جوه IndexedStack ومش بتُفتح بـ Navigator.push
        // فمافيش صفحة سابقة يترجع ليها Navigator.pop، فبنشيل زرار الرجوع
        automaticallyImplyLeading: false,
        title: const Text(
          'AI CV Analyzer',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Icon Container التفاعلي لرفع الملف
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening File Picker...')),
                  );
                },
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(15),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.document_scanner_rounded,
                    size: 64,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // النص الأساسي
              const Text(
                'Upload your CV to scan for ATS Score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              // كارت خيار بناء سي في جديد بالذكاء الاصطناعي
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50.withAlpha(150),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.indigo.shade100),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Don't have a professional CV yet?",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {
                        // بدل Navigator.push، بنغيّر التاب الحالي في
                        // MainNavigationScreen علشان يظهر الشريط السفلي بشكل صحيح
                        onNavigateToTab?.call(1);
                      },
                      icon: const Icon(
                        Icons.auto_awesome,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      label: const Text(
                        'Build Your CV with AI Coach',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}