import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'helper_widgets.dart'; 

class HelpCenterCard extends StatelessWidget {
  const HelpCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.helpCardWidth(context),
      height: AppDimensions.helpCardHeight(context),
      child: Card(
        color: AppColors.textFieldFill,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.helpCardPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Справочный центр',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.helpCardTitleSize(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimensions.helpCardTextSize(context) * 0.8,
                    color: Colors.white70,
                  ),
                ],
              ),
              WSizedBox(wval: 0, hval: 0.01), // 1% высоты экрана
              buildHelpLink('Как создать первого бота?'),
              buildHelpLink('Как работают условия if?'),
              buildHelpLink('Где получить токен?'),
              buildHelpLink('Почему мой бот не работает?'),
              WSizedBox(wval: 0, hval: 0.02), // 2%
              Center(
                child: CustomButton(
                  buttontext: 'База знаний',
                  width: AppDimensions.helpCardButtonWidth(context),
                  height: AppDimensions.helpCardButtonHeight(context),
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.buttonTextSize(context),
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {},
                ),
              ),
              WSizedBox(wval: 0, hval: 0.01), // 1%
            ],
          ),
        ),
      ),
    );
  }
}