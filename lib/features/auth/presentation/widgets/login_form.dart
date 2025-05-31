import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class LoginForm extends StatefulWidget {
  final AuthViewModel viewModel;

  const LoginForm({super.key, required this.viewModel});

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
        borderSide: BorderSide(color: AppColors.textFieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.textFieldFocusedBorder),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Поле Email
          SizedBox(
            width: screenWidth * 0.2,
            child: TextField(
              controller: widget.viewModel.emailController,
              style: const TextStyle(color: AppColors.textFieldText),
              decoration: _buildInputDecoration('Email'),
            ),
          ),

          const SizedBox(height: 16),

          // Поле Пароль
          SizedBox(
            width: screenWidth * 0.2,
            child: TextField(
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
          ),

          // Сообщение об ошибке
          if (widget.viewModel.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.viewModel.error!,
                style: AppTextStyles.error,
                textAlign: TextAlign.center,
              ),
            ),

          const SizedBox(height: 24),

          // Кнопка "Войти"
          CustomButton(
            buttontext: 'Войти',
            width: screenWidth * 0.2,
            height: screenHeight * 0.04,
            bordercolor: AppColors.primary,
            borderradius: 20,
            fontsize: 16,
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

          const SizedBox(height: 24),

          // Продолжить с Google
          CustomButton(
            buttontext: 'Продолжить с Google',
            leadingIconPath: 'assets/images/ggl.png',
            width: screenWidth * 0.2,
            height: screenHeight * 0.04,
            bordercolor: Colors.white,
            borderradius: 20,
            fontsize: 16,
            fontweight: FontWeight.bold,
            fontcolor: Colors.black,
            containercolor: Colors.white,
            onPressed: () {},
          ),

          const SizedBox(height: 8),

          // Продолжить с VK
          CustomButton(
            buttontext: 'Продолжить с VK',
            leadingIconPath: 'assets/images/vk.png',
            width: screenWidth * 0.2,
            height: screenHeight * 0.04,
            bordercolor: const Color(0xFF456DBE),
            borderradius: 20,
            fontsize: 16,
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