import 'package:flutter/material.dart';
import 'features/welcome/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Career Coach',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF673AB7),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF673AB7)),
      ),
      // هنا خلينا التطبيق يبدأ من شاشة الـ Splash اللي هتنقلك تلقائي للدخول والـ Onboarding
      home: const SplashScreen(),
    );
  }
}
