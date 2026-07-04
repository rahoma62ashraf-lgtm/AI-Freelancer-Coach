import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C5CE7);
  static const Color primaryLight = Color(0xFFA29BFE);
  static const Color secondary = Color(0xFF00CEC9);
  static const Color bgLight = Color(
    0xFFF8F9FA,
  ); // التأكيد على تعريف bgLight هنا
  static const Color bgDark = Color(0xFF0F0C20);
  static const Color textDark = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);

  // التأكيد على إضافة ألوان النجاح والتحذير لـ CV Analyzer والشات
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF1C40F);

  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C5CE7), Color(0xFF3498DB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient darkBackgroundGradient = LinearGradient(
    colors: [Color(0xFF050314), Color(0xFF0F0C20)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
