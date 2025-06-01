import 'package:flutter/material.dart';

class AppDimensions {
  // Проценты от высоты экрана
  static double percentHeight(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  // Проценты от ширины экрана
  static double percentWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }

  // Минимальная ширина кнопки
  static const double minButtonWidth = 100.0;
  static const double minButtonHeight = 40.0;
  static double textFieldWidth(BuildContext context) => percentWidth(context, 0.2);
  static double textFieldHeight(BuildContext context) => percentHeight(context, 0.07);

  // Отступы
  static double gapBetweenFields(BuildContext context) => percentHeight(context, 0.015);
  static double gapAfterErrorText(BuildContext context) => percentHeight(context, 0.02);
  static double gapBetweenButtons(BuildContext context) => percentHeight(context, 0.015);

  // Кнопки
  static double buttonHeightLogin(BuildContext context) => percentHeight(context, 0.04);
  // Размеры для кнопок
  static double buttonWidthLogin(BuildContext context) => percentWidth(context, 0.095);
  static double buttonWidthRegister(BuildContext context) => percentWidth(context, 0.12);
  static double buttonHeight(BuildContext context) => percentHeight(context, 0.05);
  static double buttonWidth(BuildContext context) => percentWidth(context, 0.2);
  
  // helpCenter

  static double helpCardWidth(BuildContext context) => percentWidth(context, 0.4);
  static double helpCardHeight(BuildContext context) => percentHeight(context, 0.4);

  static double helpCardPadding(BuildContext context) => percentWidth(context, 0.01);
  static double helpCardButtonWidth(BuildContext context) => percentWidth(context, 0.15);
  static double helpCardButtonHeight(BuildContext context) => percentHeight(context, 0.05);

  static double helpCardTextSize(BuildContext context) => percentWidth(context, 0.014);
  static double helpCardTitleSize(BuildContext context) => percentWidth(context, 0.012);

  // statscard

  static double statsCardWidth(BuildContext context) => percentWidth(context, 0.4);
  static double statsCardHeight(BuildContext context) => percentHeight(context, 0.52);

  static double statsButtonWidth(BuildContext context) => percentWidth(context, 0.15);
  static double statsButtonHeight(BuildContext context) => percentHeight(context, 0.05);

  static double statsTextSize(BuildContext context) => percentWidth(context, 0.01);
  static double statsTitleSize(BuildContext context) => percentWidth(context, 0.012);

  //tariff
  static double tariffCardWidth(BuildContext context) => percentWidth(context, 0.4);
  static double tariffCardHeight(BuildContext context) => percentHeight(context, 0.33);

  static double tariffButtonWidth(BuildContext context) => percentWidth(context, 0.1);
  static double tariffButtonHeight(BuildContext context) => percentHeight(context, 0.03);

  static double tariffTextSize(BuildContext context) => percentWidth(context, 0.01);
  static double tariffTitleSize(BuildContext context) => percentWidth(context, 0.012);
  // Отступы
  static double paddingVerticalWelcomeText(BuildContext context) => percentHeight(context, 0.02);
  static double paddingBetweenButtons(BuildContext context) => percentWidth(context, 0.02);
  static double paddingHorizontalForm(BuildContext context) => percentWidth(context, 0.02);
  static double gapAfterLogo(BuildContext context) => percentHeight(context, 0.03);
  static double gapAfterTitle(BuildContext context) => percentHeight(context, 0.03);
  static double gapAfterButtons(BuildContext context) => percentHeight(context, 0.03); // <--- добавили

  // Логотип
  static double logoSize(BuildContext context) => percentWidth(context, 0.15);

  // Текст
  static double welcomeTextSize(BuildContext context) => percentWidth(context, 0.01);
  static double buttonTextSize(BuildContext context) => percentWidth(context, 0.012);
}