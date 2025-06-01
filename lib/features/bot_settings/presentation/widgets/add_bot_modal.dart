import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/add_bot_page.dart';

class AddBotModal extends StatelessWidget {
  final double widthPercent;
  final double heightPercent;

  const AddBotModal({
    Key? key,
    this.widthPercent = 35,
    this.heightPercent = 42,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final calculatedWidth = screenWidth * widthPercent / 100;
    final calculatedHeight = screenHeight * heightPercent / 100;

    return Dialog(
      backgroundColor: Colors.transparent, // ← Прозрачный фон диалога
      insetPadding: EdgeInsets.all(16), // Отступы от краёв экрана
      elevation: 0, // Убираем стандартную тень
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // ← Закругление
        child: Container(
          width: calculatedWidth,
          height: calculatedHeight,
          color: AppColors.background, // Цвет фона внутри
          child: const AddBotPage(),
        ),
      ),
    );
  }
}