import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';
import 'helper_widgets.dart';

void showChangeTelegramDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final dialogButtonWidth = screenWidth * 0.1;
  final dialogButtonHeight = screenHeight * 0.05;

  showDialog(
    context: context,
    builder: (_) => _buildDialog(
      context,
      title: 'Сменить Telegram аккаунт',
      widthFactor: 0.25,
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
              width: dialogButtonWidth * 0.6,
              height: dialogButtonHeight * 0.6,
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

void showChangePasswordDialog(BuildContext context, AuthViewModel viewModel) async {
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  String? error;

  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final dialogButtonWidth = screenWidth * 0.1;
  final dialogButtonHeight = screenHeight * 0.05;

  await showDialog(
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => _buildDialog(
        context,
        title: 'Сменить пароль',
        widthFactor: 0.25,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Старый пароль', style: TextStyle(fontSize: 14, color: Colors.white)),
            WSizedBox(wval: 0, hval: 0.01),
            buildInputField(
              'Старый пароль',
              controller: oldPassController,
              obscureText: true,
              hintSize: 14,
            ),
            WSizedBox(wval: 0, hval: 0.015),

            Text('Новый пароль', style: TextStyle(fontSize: 14, color: Colors.white)),
            WSizedBox(wval: 0, hval: 0.01),
            buildInputField(
              'Новый пароль',
              controller: newPassController,
              obscureText: true,
              hintSize: 14,
            ),
            WSizedBox(wval: 0, hval: 0.015),

            Text('Подтвердите пароль', style: TextStyle(fontSize: 14, color: Colors.white)),
            WSizedBox(wval: 0, hval: 0.01),
            buildInputField(
              'Подтвердите пароль',
              controller: confirmPassController,
              obscureText: true,
              hintSize: 14,
            ),

            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  error!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            WSizedBox(wval: 0, hval: 0.02),

            Align(
              alignment: Alignment.center,
              child: CustomButton(
                buttontext: 'Сохранить',
                width: dialogButtonWidth * 0.6,
                height: dialogButtonHeight * 0.6,
                borderradius: 12,
                bordercolor: AppColors.buttonBorder,
                fontsize: 14,
                fontweight: FontWeight.normal,
                fontcolor: Colors.black,
                containercolor: AppColors.buttonBorder,
                onPressed: () async {
                  final oldPass = oldPassController.text.trim();
                  final newPass = newPassController.text.trim();
                  final confirmPass = confirmPassController.text.trim();

                  // Валидация полей
                  if (oldPass.isEmpty || newPass.isEmpty || confirmPass.isEmpty) {
                    setState(() {
                      error = 'Все поля должны быть заполнены';
                    });
                    return;
                  }

                  if (newPass != confirmPass) {
                    setState(() {
                      error = 'Пароли не совпадают';
                    });
                    return;
                  }

                  try {
                    // ✅ Вызываем твой существующий метод
                    await viewModel.changePassword(oldPass, newPass, confirmPass);

                    Navigator.of(context).pop(); // закрываем диалог
                  } catch (e) {
                    setState(() {
                      error = e.toString().replaceAll('Exception: ', '');
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // Очистка контроллеров после использования
  oldPassController.dispose();
  newPassController.dispose();
  confirmPassController.dispose();
}

void showChangeEmailDialog(BuildContext context, AuthViewModel viewModel) async {
  final passwordController = TextEditingController();
  final newEmailController = TextEditingController();

  String? error;

  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final dialogButtonWidth = screenWidth * 0.1;
  final dialogButtonHeight = screenHeight * 0.05;

  await showDialog(
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => _buildDialog(
        context,
        title: 'Сменить Email',
        widthFactor: 0.25, // <-- Сужаем диалог до 25% ширины экрана
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Пароль', style: TextStyle(fontSize: 14, color: Colors.white)),
            WSizedBox(wval: 0, hval: 0.01),
            buildInputField(
              'Пароль',
              controller: passwordController,
              obscureText: true,
              hintSize: 14,
            ),
            WSizedBox(wval: 0, hval: 0.015),

            Text('Новый Email', style: TextStyle(fontSize: 14, color: Colors.white)),
            WSizedBox(wval: 0, hval: 0.01),
            buildInputField(
              'Новый Email',
              controller: newEmailController,
              hintSize: 14,
            ),

            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  error!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            WSizedBox(wval: 0, hval: 0.02),

            Align(
              alignment: Alignment.center,
              child: CustomButton(
                buttontext: 'Сохранить',
                width: dialogButtonWidth * 0.6,
                height: dialogButtonHeight * 0.6,
                borderradius: 12,
                bordercolor: AppColors.buttonBorder,
                fontsize: 14,
                fontweight: FontWeight.normal,
                fontcolor: Colors.black,
                containercolor: AppColors.buttonBorder,
                onPressed: () async {
                  final password = passwordController.text.trim();
                  final newEmail = newEmailController.text.trim();

                  if (password.isEmpty || newEmail.isEmpty) {
                    setState(() {
                      error = 'Все поля должны быть заполнены';
                    });
                    return;
                  }

                  try {
                    await viewModel.changeEmail(password, newEmail);
                    Navigator.of(context).pop(); // закрыть диалог
                  } catch (e) {
                    setState(() {
                      error = e.toString().replaceAll('Exception: ', '');
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // Очистка контроллеров после закрытия
  passwordController.dispose();
  newEmailController.dispose();
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