import 'package:flutter/material.dart';
import '../auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
class RegisterForm extends StatelessWidget {
  final AuthViewModel viewModel;

  const RegisterForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          // Email
          TextField(
            controller: viewModel.emailController,
            style: AppTextStyles.textFieldLabel, // ✅ Цвет вводимого текста
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
            style: AppTextStyles.textFieldLabel, // ✅ Белый текст
            decoration: InputDecoration(
              labelText: 'Пароль',
              labelStyle: AppTextStyles.textFieldLabel,
            ),
          ),
          const SizedBox(height: 10),

          // Повторите пароль
          TextField(
            obscureText: true,
            style: AppTextStyles.textFieldLabel, // ✅ Белый текст
            decoration: InputDecoration(
              labelText: 'Повторите пароль',
              labelStyle: AppTextStyles.textFieldLabel,
            ),
          ),

          // Ошибка
          if (viewModel.error != null && viewModel.passwordController.text.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                viewModel.error!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                      fontSize: 10,
                    ),
              ),
            ),

          const SizedBox(height: 8),

          // Кнопка "Зарегистрироваться"
          CustomButton(
            buttontext: 'Зарегистрироваться',
            width: 0.08,
            height: 0.05,
            borderradius: 10,
            bordercolor: const Color(0xFF41ACE4),
            fontsize: 10,
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            containercolor: const Color(0xFF41ACE4),
            onPressed: () {
              // TODO: реализация регистрации
            },
          ),

          const SizedBox(height: 10),

          // Google
          CustomButton(
            buttontext: 'Google',
            width: 0.08,
            height: 0.05,
            borderradius: 10,
            bordercolor: Colors.white,
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
            width: 0.08,
            height: 0.05,
            borderradius: 10,
            bordercolor: const Color(0xFF456DBE),
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