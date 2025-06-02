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
  
  //show dialoge
 
  static const double minDialogWidth = 300.0;
  static const double minDialogHeight = 300.0;
  static double dialogButtonMinWidth(BuildContext context) =>
      percentWidth(context, 0.15);

  static double dialogButtonMinHeight(BuildContext context) =>
      percentHeight(context, 0.04);

  static double dialogButtonTextSize(BuildContext context) =>
      percentWidth(context, 0.014);

  static double dialogTitleFontSize(BuildContext context) =>
      percentWidth(context, 0.016);

  static EdgeInsets dialogInsetPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final dialogWidth = width *0.5;
    final horizontalPadding = (width - dialogWidth) / 2;
    return EdgeInsets.symmetric(horizontal: horizontalPadding);
  }

  //helperwidget
  static double inputFieldWidth(BuildContext context) => percentWidth(context, 0.4);
  static double inputFieldHeight(BuildContext context) => percentHeight(context, 0.05);

  static double inputTextSize(BuildContext context) => percentWidth(context, 0.014);
  static double inputHintSize(BuildContext context) => percentWidth(context, 0.013);

  static double helpLinkTextSize(BuildContext context) => percentWidth(context, 0.014);

  // profilecard

  static const double profileCardWidthFactor = 0.4;
  static const double profileCardHeightFactor = 0.6;

  static const double profileButtonWidthFactor = 0.13;
  static const double profileButtonHeightFactor = 0.035;

  static double percentWidthFromSize(Size size, double percent) => size.width * percent;
  static double percentHeightFromSize(Size size, double percent) => size.height * percent;

  static double profileCardWidthFromSize(Size size) => percentWidthFromSize(size, profileCardWidthFactor);
  static double profileCardHeightFromSize(Size size) => percentHeightFromSize(size, profileCardHeightFactor);

  static double profileButtonWidthFromSize(Size size) => percentWidthFromSize(size, profileButtonWidthFactor);
  static double profileButtonHeightFromSize(Size size) => percentHeightFromSize(size, profileButtonHeightFactor);

  static double profileTextSizeFromSize(Size size) => percentWidthFromSize(size, 0.01);
  static double profileTitleSizeFromSize(Size size) => percentWidthFromSize(size, 0.012);

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
  static double tariffCardHeight(BuildContext context) => percentHeight(context, 0.32);

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

  // Registration page mobile
  // Размеры для мобильной версии
  static double logoSizeMobile(BuildContext context) => percentWidth(context, 0.5);
  static double welcomeTextSizeMobile(BuildContext context) => percentWidth(context, 0.06);
  static double paddingVerticalWelcomeTextMobile(BuildContext context) => percentHeight(context, 0.02);
  static double gapAfterTitleMobile(BuildContext context) => percentHeight(context, 0.02);
  static double gapAfterButtonsMobile(BuildContext context) => percentHeight(context, 0.02);
  static double paddingHorizontalFormMobile(BuildContext context) => percentWidth(context, 0.05);

  // Кнопки
  static double buttonWidthLoginMobile(BuildContext context) => percentWidth(context, 0.4);
  static double buttonWidthRegisterMobile(BuildContext context) => percentWidth(context, 0.4);
  static double buttonHeightMobile(BuildContext context) => percentHeight(context, 0.06);
  static double buttonTextSizeMobile(BuildContext context) => percentWidth(context, 0.04);
  static double paddingBetweenButtonsMobile(BuildContext context) => percentWidth(context, 0.02);

  // Минимальные размеры кнопок
  static const double minButtonWidthMobile = 120;
  static const double minButtonHeightMobile = 40;

  // Reg form mobile
  // Размеры полей и кнопок
  static double textFieldWidthMobile(BuildContext context) => MediaQuery.of(context).size.width - 80;
  static double gapBetweenFieldsMobile(BuildContext context) => percentHeight(context, 0.02);
  static double gapAfterErrorTextMobile(BuildContext context) => percentHeight(context, 0.015);
  static double gapBetweenButtonsMobile(BuildContext context) => percentHeight(context, 0.015);

  // Размеры кнопок form
  static double buttonHeightRegisterFormMobile(BuildContext context) => percentHeight(context, 0.05);
  static double buttonWidthRegisterFormMobile(BuildContext context) => percentHeight(context, 0.05);
  // Текст кнопок form
  static double buttonTextSizeFormMobile(BuildContext context) => percentWidth(context, 0.04);

  // Размеры start page mobile
  static double buttonHeightStartPageMobile(BuildContext context) => percentHeight(context, 0.05);
  static double buttonWidthStartPageMobile(BuildContext context) => percentHeight(context, 0.3);
  static double buttonTextSizeStartPageMobile(BuildContext context) => percentWidth(context, 0.035);

  // Размеры start page mobile
  static double buttonHeightStartPageWeb(BuildContext context) => percentHeight(context, 0.05);
  static double buttonWidthStartPageWeb(BuildContext context) => percentHeight(context, 0.3);
  static double buttonTextSizeStartPageWeb(BuildContext context) => percentWidth(context, 0.008);
  static double startTextSize(BuildContext context) => percentWidth(context, 0.02);

    // profilecard Mobile

  static const double profileCardWidthFactorMobile = 1;
  static const double profileCardHeightFactorMobile = 1;

  static const double profileButtonWidthFactorMobile = 0.3;
  static const double profileButtonHeightFactorMobile = 0.03;

  static double percentWidthFromSizeMobile(Size size, double percent) => size.width * percent;
  static double percentHeightFromSizeMobile(Size size, double percent) => size.height * percent;

  static double profileCardWidthFromSizeMobile(Size size) => percentWidthFromSizeMobile(size, profileCardWidthFactorMobile);
  static double profileCardHeightFromSizeMobile(Size size) => percentHeightFromSizeMobile(size, profileCardHeightFactorMobile);

  static double profileButtonWidthFromSizeMobile(Size size) => percentWidthFromSizeMobile(size, profileButtonWidthFactorMobile);
  static double profileButtonHeightFromSizeMobile(Size size) => percentHeightFromSizeMobile(size, profileButtonHeightFactorMobile);

  static double profileTextSizeFromSizeMobile(Size size) => percentWidthFromSizeMobile(size, 0.03);
  static double profileTitleSizeFromSizeMobile(Size size) => percentWidthFromSizeMobile(size, 0.05);


    //tariffMobile
  static const double tariffCardWidthFactorMobile = 1;
  static const double tariffCardHeightFactorMobile = 1;

  static const double tariffButtonWidthFactorMobile = 0.3;
  static const double tariffButtonHeightFactorMobile = 0.03;


  static double tariffCardWidthFromSizeMobile(Size size) => percentWidthFromSizeMobile(size, tariffCardWidthFactorMobile);
  static double tariffCardHeightFromSizeMobile(Size size) => percentHeightFromSizeMobile(size, tariffCardHeightFactorMobile);


  static double tariffButtonWidthMobile(BuildContext context) => percentWidth(context, 0.1);
  static double tariffButtonHeightMobile(BuildContext context) => percentHeight(context, 0.03);

  static double tariffTextSizeMobile(BuildContext context) => percentWidth(context, 0.01);
  static double tariffTitleSizeMobile(BuildContext context) => percentWidth(context, 0.012);

    // helpCenterMobile

  static double helpCardWidthMobile(BuildContext context) => percentWidth(context, 0.4);
  static double helpCardHeightMobile(BuildContext context) => percentHeight(context, 0.4);

  static double helpCardPaddingMobile(BuildContext context) => percentWidth(context, 0.01);
  static double helpCardButtonWidthMobile(BuildContext context) => percentWidth(context, 0.5);
  static double helpCardButtonHeightMobile(BuildContext context) => percentHeight(context, 0.05);

  static double helpCardTextSizeMobile(BuildContext context) => percentWidth(context, 0.014);
  static double helpCardTitleSizeMobile(BuildContext context) => percentWidth(context, 0.012);

}