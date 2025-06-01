import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/features/bot_settings/presentation/pages/bot_details_page.dart';

class BotDetailsModal extends StatelessWidget {
  final dynamic bot;

  const BotDetailsModal({
    Key? key,
    required this.bot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Определяем параметры на основе ширины экрана
    final isLargeScreen = screenWidth > 600;
    final widthPercent = isLargeScreen ? 35.0 : 90.0;
    final heightPercent = isLargeScreen ? 48.0 : 50.0;

    final calculatedWidth = screenWidth * widthPercent / 100;
    final calculatedHeight = screenHeight * heightPercent / 100;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: calculatedWidth,
          height: calculatedHeight,
          color: AppColors.background,
          child: BotDetailsPage(bot: bot),
        ),
      ),
    );
  }
}