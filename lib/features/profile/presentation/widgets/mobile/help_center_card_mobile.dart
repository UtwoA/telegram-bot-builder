import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/mobile/helper_widgets_mobile.dart';

class HelpCenterCardMobile extends StatelessWidget {
  const HelpCenterCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: AppDimensions.percentWidthFromSizeMobile(screenSize, 1),
      height: AppDimensions.percentHeightFromSizeMobile(screenSize, 0.35),
      child: Card(
        color: AppColors.textFieldFill,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.helpCardPaddingMobile(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Справочный центр',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.profileTitleSizeFromSizeMobile(screenSize),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                
                ],
              ),
              WSizedBox(wval: 0, hval: 0.01), // 1% высоты экрана
              buildHelpLink('Как создать первого бота?', context),
              buildHelpLink('Как работают условия if?', context),
              buildHelpLink('Где получить токен?', context),
              buildHelpLink('Почему мой бот не работает?', context),
              WSizedBox(wval: 0, hval: 0.02), // 2%
              Center(
                child: CustomButton(
                  buttontext: 'База знаний',
                  width: AppDimensions.helpCardButtonWidthMobile(context),
                  height: AppDimensions.helpCardButtonHeightMobile(context),
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.buttonTextSizeMobile(context),
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {
                    Navigator.pushNamed(context, '/helpcenter');
                  },
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