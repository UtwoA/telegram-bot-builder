import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class TariffCard extends StatelessWidget {
  const TariffCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonWidth = screenWidth * 0.1;
    final buttonHeight = screenHeight * 0.03;

    return SizedBox(
      width: screenWidth * 0.4,
      height: screenHeight * 0.3,
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
                  Text('Тарифный план', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Ваш тариф:', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 12),
              const Text('Free до 01.01.1980', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 24),
              Center(
                child: CustomButton(
                  buttontext: 'Тарифы',
                  width: buttonWidth,
                  height: buttonHeight * 1.5,
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: 14,
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: CustomButton(
                  buttontext: 'История платежей',
                  width: buttonWidth,
                  height: buttonHeight,
                  borderradius: 10,
                  bordercolor: Color(0xFF17212B),
                  fontsize: 14,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.white,
                  containercolor: Color(0xFF17212B),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: CustomButton(
                  buttontext: 'Связь с поддержкой',
                  width: buttonWidth,
                  height: buttonHeight,
                  borderradius: 10,
                  bordercolor: Color(0xFF17212B),
                  fontsize: 14,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.white,
                  containercolor: Color(0xFF17212B),
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