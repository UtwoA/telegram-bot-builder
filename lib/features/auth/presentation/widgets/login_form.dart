import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/features/auth/presentation/auth_view_model.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class LoginForm extends StatefulWidget {
  final AuthViewModel viewModel;

  const LoginForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  InputDecoration _buildInputDecoration(String label, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.textFieldLabel),
      filled: true,
      fillColor: AppColors.textFieldFill,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.textFieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.textFieldFocusedBorder),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          // Email
          TextField(
            controller: widget.viewModel.emailController,
            style: const TextStyle(color: AppColors.textFieldText),
            decoration: _buildInputDecoration('Email'),
          ),
          const SizedBox(height: 10),

          // Пароль
          TextField(
            controller: widget.viewModel.passwordController,
            obscureText: _obscurePassword,
            style: const TextStyle(color: AppColors.textFieldText),
            decoration: _buildInputDecoration(
              'Пароль',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textFieldLabel,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
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
          if (widget.viewModel.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.viewModel.error!,
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
              final email = widget.viewModel.emailController.text.trim();
              final password = widget.viewModel.passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                widget.viewModel.setError('Заполните все поля');
                return;
              }

              widget.viewModel.setError(null);
              widget.viewModel.login();
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
