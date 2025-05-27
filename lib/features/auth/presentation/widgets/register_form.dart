import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/features/auth/presentation/auth_view_model.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class RegisterForm extends StatelessWidget {
  final AuthViewModel viewModel;
  final TextEditingController confirmController = TextEditingController();

  RegisterForm({Key? key, required this.viewModel}) : super(key: key);

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
          const SizedBox(height: 10),

          // Повторите пароль
          TextField(
            controller: confirmController,
            obscureText: true,
            style: AppTextStyles.textFieldLabel,
            decoration: InputDecoration(
              labelText: 'Повторите пароль',
              labelStyle: AppTextStyles.textFieldLabel,
            ),
          ),

          // Ошибка
          if (viewModel.error != null)
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
              final email = viewModel.emailController.text.trim();
              final password = viewModel.passwordController.text.trim();
              final confirmPassword = confirmController.text.trim();

              if (password.isEmpty || confirmPassword.isEmpty) {
                viewModel.setError('Заполните все поля');
                return;
              }

              if (password.length < 6) {
                viewModel.setError('Пароль должен быть не короче 6 символов');
                return;
              }

              if (password != confirmPassword) {
                viewModel.setError('Пароли не совпадают');
                return;
              }

              viewModel.setError(null);
              viewModel.register(email, password);
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