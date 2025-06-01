import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'helper_widgets.dart';

class HelpCenterCard extends StatelessWidget {
  const HelpCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.4;

    return SizedBox(
      width: cardWidth,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        color: AppColors.textFieldFill,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Справочный центр', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
                ],
              ),
              const SizedBox(height: 12),
              buildHelpLink('Как создать первого бота?'),
              buildHelpLink('Как работают условия if?'),
              buildHelpLink('Где получить токен?'),
              buildHelpLink('Почему мой бот не работает?'),
              const SizedBox(height: 16),
              Center(
                child: CustomButton(
                  buttontext: 'База знаний',
                  width: 120,
                  height: 40,
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: 14,
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}