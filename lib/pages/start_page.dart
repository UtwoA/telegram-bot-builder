import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/custom_image.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/core/widgets/wsized.dart';
import 'package:url_launcher/url_launcher.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: const Color(0xFF242F3D),
      body: Stack(
        children: [
          // Градиентный фон верхней части
          Container(
            height: screenHeight * 0.3,
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
          Container(
            padding: EdgeInsets.only(top: screenHeight * 0.01), // 10% от высоты экрана сверху
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Логотип Telegram
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/icon207.png',
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                  ),
                ),

                // Текст приветствия
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1), // 10% от высоты экрана сверху
                  child: TextWidget(
                    text: 'Добро пожаловать!',
                    textcolor: Colors.white,
                    textsize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Текст добавочный
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1), // 10% от высоты экрана сверху
                  child: TextWidget(
                    text: 'Начните творить что-то там...',
                    textcolor: Colors.white,
                    textsize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.1), // 10% от высоты экрана сверху
                      child: CustomButton(
                        buttontext: 'Создать своего телеграм бота',
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.05,
                        bordercolor: const Color(0xFF41ACE4),
                        borderradius: 20,
                        fontsize: 14,
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
