import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';

class StartPageMobile extends StatelessWidget {
  const StartPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242F3D),
      body: Stack(
        children: [
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
          Container(
            padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.01)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/icon207.png',
                    width: AppDimensions.logoSizeMobile(context),
                    height: AppDimensions.logoSizeMobile(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.1)),
                  child: TextWidget(
                    text: 'Добро пожаловать!',
                    textcolor: Colors.white,
                    textsize: AppDimensions.welcomeTextSizeMobile(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.05)),
                  child: TextWidget(
                    text: 'Начните творить что-то там...',
                    textcolor: Colors.white,
                    textsize: AppDimensions.welcomeTextSizeMobile(context),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.1)),
                      child: CustomButton(
                        buttontext: 'Создать своего телеграм бота',
                        width: AppDimensions.buttonWidthStartPageMobile(context),
                        height: AppDimensions.buttonHeightStartPageMobile(context),
                        bordercolor: const Color(0xFF41ACE4),
                        borderradius: 20,
                        fontsize: AppDimensions.buttonTextSizeStartPageMobile(context),
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