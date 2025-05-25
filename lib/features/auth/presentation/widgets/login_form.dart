import 'package:flutter/material.dart';
import '../auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';

class LoginForm extends StatelessWidget {
  final AuthViewModel viewModel;

  const LoginForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          TextField(
            style: AppTextStyles.textFieldLabel,
            controller: viewModel.emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: AppTextStyles.textFieldLabel,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: AppTextStyles.textFieldLabel,
            controller: viewModel.passwordController,
            obscureText: true,
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
          if (viewModel.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                viewModel.error!,
                style: AppTextStyles.error,
              ),
            ),
          const SizedBox(height: 8),
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
              viewModel.login();
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            buttontext: 'Продолжить с Google',
            leadingIconPath: 'assets/images/ggl.png', // твой путь к картинке
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
          CustomButton(
            buttontext: 'Продолжить с VK',
            leadingIconPath: 'assets/images/vk.png', // твой путь к картинке
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