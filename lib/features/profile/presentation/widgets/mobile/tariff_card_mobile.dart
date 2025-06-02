import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/helper_widgets.dart'; // Импортируем AppDimensions

class TariffCardMobile extends StatelessWidget {
  const TariffCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: AppDimensions.percentWidthFromSizeMobile(screenSize, 1),
      height: AppDimensions.percentHeightFromSizeMobile(screenSize, 0.3),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Тарифный план',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.profileTitleSizeFromSizeMobile(screenSize),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(color: Colors.white12),
                ],
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1% высоты
              Text(
                'Ваш тариф:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.tariffTextSizeMobile(context) * 4,
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1.5%
              Text(
                'Free до 01.01.1980',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.tariffTextSizeMobile(context) * 3,
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~2%
              Center(
                child: CustomButton(
                  buttontext: 'Тарифы',
                  width: AppDimensions.tariffButtonWidthMobile(context) * 5,
                  height: AppDimensions.tariffButtonHeightMobile(context) * 1.5,
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.tariffTextSizeMobile(context) * 3,
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {
                    Navigator.pushNamed(context, '/tariff');
                  },
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1.5%
              Center(
                child: CustomButton(
                  buttontext: 'История платежей',
                  width: AppDimensions.tariffButtonWidthMobile(context) * 3,
                  height: AppDimensions.tariffButtonHeightMobile(context),
                  borderradius: 10,
                  bordercolor: const Color(0xFF17212B),
                  fontsize: AppDimensions.tariffTextSizeMobile(context) * 3,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.white,
                  containercolor: const Color(0xFF17212B),
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment-history');
                  },
                ),
              ),
              WSizedBox(wval: 0, hval: 0.012), // ~1.5%
              Center(
                child: CustomButton(
                  buttontext: 'Связь с поддержкой',
                  width: AppDimensions.tariffButtonWidthMobile(context) * 3,
                  height: AppDimensions.tariffButtonHeightMobile(context),
                  borderradius: 10,
                  bordercolor: const Color(0xFF17212B),
                  fontsize: AppDimensions.tariffTextSizeMobile(context) * 3,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.white,
                  containercolor: const Color(0xFF17212B),
                  onPressed: () {
                    Navigator.pushNamed(context, '/feedback');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}