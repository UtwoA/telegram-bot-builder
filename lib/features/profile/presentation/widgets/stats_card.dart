import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = screenWidth * 0.4;
    final cardHeight = screenHeight * 0.5;
    final buttonWidth = cardWidth * 0.3;
    final buttonHeight = screenHeight * 0.05;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
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
                  Text('Статистика', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2A394F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '📈 График скоро появится',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  buttontext: 'К полной статистике',
                  width: buttonWidth,
                  height: buttonHeight,
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: 12,
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