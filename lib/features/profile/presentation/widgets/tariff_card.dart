import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/helper_widgets.dart'; // Импортируем AppDimensions

class TariffCard extends StatelessWidget {
  const TariffCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.tariffCardWidth(context),
      height: AppDimensions.tariffCardHeight(context),
      child: Card(
        color: AppColors.textFieldFill,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.percentWidth(context, 0.01)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Тарифный план',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.tariffTitleSize(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimensions.tariffTextSize(context) * 0.9,
                    color: Colors.white70,
                  ),
                ],
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1% высоты
              Text(
                'Ваш тариф:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.tariffTextSize(context),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1.5%
              Text(
                'Free до 01.01.1980',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.tariffTextSize(context),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~2%
              Center(
                child: CustomButton(
                  buttontext: 'Тарифы',
                  width: AppDimensions.tariffButtonWidth(context),
                  height: AppDimensions.tariffButtonHeight(context) * 1.5,
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.tariffTextSize(context),
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {},
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1.5%
              Center(
                child: CustomButton(
                  buttontext: 'История платежей',
                  width: AppDimensions.tariffButtonWidth(context),
                  height: AppDimensions.tariffButtonHeight(context),
                  borderradius: 10,
                  bordercolor: const Color(0xFF17212B),
                  fontsize: AppDimensions.tariffTextSize(context),
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.white,
                  containercolor: const Color(0xFF17212B),
                  onPressed: () {},
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1.5%
              Center(
                child: CustomButton(
                  buttontext: 'Связь с поддержкой',
                  width: AppDimensions.tariffButtonWidth(context),
                  height: AppDimensions.tariffButtonHeight(context),
                  borderradius: 10,
                  bordercolor: const Color(0xFF17212B),
                  fontsize: AppDimensions.tariffTextSize(context),
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.white,
                  containercolor: const Color(0xFF17212B),
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