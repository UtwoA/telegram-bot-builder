import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_details_page.dart';

class BotDetailsModal extends StatelessWidget {
  final dynamic bot;
  final double widthPercent;
  final double heightPercent;

  const BotDetailsModal({
    Key? key,
    required this.bot,
    this.widthPercent = 60,
    this.heightPercent = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final calculatedWidth = screenWidth * widthPercent / 100;
    final calculatedHeight = screenHeight * heightPercent / 100;

    return Dialog(
      backgroundColor: Colors.transparent, // ← Прозрачный фон диалога
      insetPadding: EdgeInsets.all(16), // Отступы по краям экрана
      elevation: 0, // Убираем тень от Dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // ← Дублируем радиус здесь
        child: Container(
          width: calculatedWidth,
          height: calculatedHeight,
          color: AppColors.background, // Цвет фона внутри
          child: BotDetailsPage(bot: bot),
        ),
      ),
    );
  }
}