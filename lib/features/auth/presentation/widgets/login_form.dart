import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/features/auth/presentation/auth_view_model.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class LoginForm extends StatelessWidget {
  final AuthViewModel viewModel;

  const LoginForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          // Email
          TextField(
            controller: viewModel.emailController,
            style: AppTextStyles.textFieldLabel,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: AppTextStyles.textFieldLabel,
            ),
          ),
          const SizedBox(height: 10),

          // Пароль
          TextField(
            controller: viewModel.passwordController,
            obscureText: true,
            style: AppTextStyles.textFieldLabel,
            decoration: InputDecoration(
              labelText: 'Пароль',
              labelStyle: AppTextStyles.textFieldLabel,
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Забыли пароль?',
                style: AppTextStyles.link,
              ),
            ),
          ),

          // Ошибка
          if (viewModel.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                viewModel.error!,
                style: AppTextStyles.error,
              ),
            ),

          const SizedBox(height: 8),

          // Кнопка "Войти"
          CustomButton(
            buttontext: 'Войти',
            width: 0.08,
            height: 0.05,
            bordercolor: AppColors.primary,
            borderradius: 10,
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: AppColors.secondary,
            containercolor: AppColors.primary,
            onPressed: () {
              final email = viewModel.emailController.text.trim();
              final password = viewModel.passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                viewModel.setError('Заполните все поля');
                return;
              }

              viewModel.setError(null);
              viewModel.login(); // вызываем без контекста
            },
          ),

          const SizedBox(height: 10),

          // Google
          CustomButton(
            buttontext: 'Google',
            leadingIconPath: 'assets/images/ggl.png',
            width: 0.08,
            height: 0.05,
            bordercolor: Colors.white,
            borderradius: 10,
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: Colors.black,
            containercolor: Colors.white,
            onPressed: () {},
          ),

          const SizedBox(height: 6),

          // VK
          CustomButton(
            buttontext: 'VK',
            leadingIconPath: 'assets/images/vk.png',
            width: 0.08,
            height: 0.05,
            bordercolor: const Color(0xFF456DBE),
            borderradius: 10,
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            containercolor: const Color(0xFF456DBE),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}