import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get textFieldLabel => const TextStyle(
        color: AppColors.textFieldLabel,
        fontSize: 12,
      );

  static TextStyle get textFieldHint => const TextStyle(
        color: AppColors.textFieldLabel,
        fontSize: 12,
      );

  static TextStyle get button => const TextStyle(
        color: AppColors.secondary,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get link => const TextStyle(
        color: AppColors.textFieldLabel,
        fontSize: 10,
      );

  static TextStyle get error => const TextStyle(
        color: AppColors.error,
        fontSize: 10,
      );

  // === НОВЫЙ СТИЛЬ ДЛЯ ТЕКСТА В ПОЛЯХ ВВОДА ===
  static TextStyle get textFieldText => const TextStyle(
        color: AppColors.textFieldText, // из AppColors
        fontSize: 14,
      );
}