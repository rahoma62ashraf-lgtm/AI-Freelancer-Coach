import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../chat/presentation/ai_coach_chat_screen.dart';
import '../../profile/presentation/cv_analyzer_screen.dart';
import 'dashboard_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // دالة موحّدة لتغيير التاب الحالي، هنمررها للشاشات الفرعية
  // بدل ما هما يعملوا Navigator.push لبعض
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // بنبني الليستة هنا (مش final ثابتة) عشان نقدر نمرر الـ callback
  List<Widget> get _screens => [
    DashboardScreen(onNavigateToTab: _onItemTapped),
    const AiCoachChatScreen(),
    CvAnalyzerScreen(onNavigateToTab: _onItemTapped),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          type: BottomNavigationBarType.fixed,
          items: const [
            // 1️⃣ أيقونة الـ Dashboard (المطابقة للشاشة الأولى)
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            // 2️⃣ أيقونة الـ AI Coach (المطابقة للشاشة الثانية)
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              activeIcon: Icon(Icons.chat_bubble_rounded),
              label: 'AI Coach',
            ),
            // 3️⃣ أيقونة الـ Profile/CV (المطابقة للشاشة الثالثة)
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}