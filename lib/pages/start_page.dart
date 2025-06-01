import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242F3D),
      body: Stack(
        children: [
          // Градиентный фон верхней части
          Container(
            height: AppDimensions.percentHeight(context, 0.3),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF41ACE4),
                  Color(0xFF242F3D),
                ],
              ),
            ),
          ),

          // Основной контент
          Container(
            padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.01)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Логотип Telegram
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/icon207.png',
                    width: AppDimensions.logoSize(context),
                    height: AppDimensions.logoSize(context),
                  ),
                ),

                // Текст приветствия
                Padding(
                  padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.1)),
                  child: TextWidget(
                    text: 'Добро пожаловать!',
                    textcolor: Colors.white,
                    textsize: AppDimensions.welcomeTextSize(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Дополнительный текст
                Padding(
                  padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.05)),
                  child: TextWidget(
                    text: 'Начните творить что-то там...',
                    textcolor: Colors.white,
                    textsize: AppDimensions.welcomeTextSize(context) * 0.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                // Кнопка
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.1)),
                      child: CustomButton(
                        buttontext: 'Создать своего телеграм бота',
                        width: AppDimensions.buttonWidth(context),
                        height: AppDimensions.buttonHeight(context),
                        bordercolor: const Color(0xFF41ACE4),
                        borderradius: 20,
                        fontsize: AppDimensions.buttonTextSize(context),
                        fontweight: FontWeight.bold,
                        fontcolor: Colors.white,
                        containercolor: const Color(0xFF41ACE4),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}