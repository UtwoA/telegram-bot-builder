import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/mobile/helper_widgets_mobile.dart';

void showChangeTelegramDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final dialogButtonWidth = screenWidth;
  final dialogButtonHeight = screenHeight;

  showDialog(
    context: context,
    builder: (_) => _buildDialog(
      context,
      title: 'Сменить Telegram аккаунт',
      widthFactor: 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildInputField('Новый логин'),
          WSizedBox(wval: 0, hval: 0.01),
          buildInputField('Код подтверждения'),
          WSizedBox(wval: 0, hval: 0.02),
          Center(
            child: CustomButton(
              buttontext: 'Сохранить',
              width: dialogButtonWidth * 0.3,
              height: dialogButtonHeight * 0.03,
              borderradius: 12,
              bordercolor: AppColors.buttonBorder,
              fontsize: 14,
              fontweight: FontWeight.normal,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: Navigator.of(context).pop,
            ),
          ),
        ],
      ),
    ),
  );
}

void showChangePasswordDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final dialogButtonWidth = screenWidth * 0.1;
  final dialogButtonHeight = screenHeight * 0.05;

  showDialog(
    context: context,
    builder: (_) => _buildDialog(
      context,
      title: 'Сменить пароль',
      widthFactor: 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildInputField('Старый пароль', obscureText: true),
          WSizedBox(wval: 0, hval: 0.01),
          buildInputField('Новый пароль', obscureText: true),
          WSizedBox(wval: 0, hval: 0.01),
          buildInputField('Повторите пароль', obscureText: true),
          WSizedBox(wval: 0, hval: 0.02),
          Center(
            child: CustomButton(
              buttontext: 'Сохранить',
              width: dialogButtonWidth * 0.3,
              height: dialogButtonHeight * 0.03,
              borderradius: 12,
              bordercolor: AppColors.buttonBorder,
              fontsize: 14,
              fontweight: FontWeight.normal,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: Navigator.of(context).pop,
            ),
          ),
        ],
      ),
    ),
  );
}

void showChangeEmailDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final dialogButtonWidth = screenWidth * 0.1;
  final dialogButtonHeight = screenHeight * 0.05;

  showDialog(
    context: context,
    builder: (_) => _buildDialog(
      context,
      title: 'Сменить Email',
      widthFactor: 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildInputField('Пароль', obscureText: true),
          WSizedBox(wval: 0, hval: 0.01),
          buildInputField('Новый Email'),
          WSizedBox(wval: 0, hval: 0.05),
          Center(
            child: CustomButton(
              buttontext: 'Сохранить',
              width: dialogButtonWidth * 0.3,
              height: dialogButtonHeight * 0.03,
              borderradius: 12,
              bordercolor: AppColors.buttonBorder,
              fontsize: 14,
              fontweight: FontWeight.normal,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: Navigator.of(context).pop,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildDialog(BuildContext context,
    {required String title, required double widthFactor, required Widget child}) {
  final dialogWidth = MediaQuery.of(context).size.width * widthFactor;
  return Dialog(
    backgroundColor: AppColors.cardBackground,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    insetPadding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width * (1 - widthFactor)) / 2),
    child: SizedBox(
      width: dialogWidth,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    ),
  );
}