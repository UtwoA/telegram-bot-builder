import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/auth/presentation/auth_view_model.dart';

class RegisterForm extends StatefulWidget {
  final AuthViewModel viewModel;

  const RegisterForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController confirmController = TextEditingController();
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
          const SizedBox(height: 10),

          // Повторите пароль
          TextField(
            controller: confirmController,
            obscureText: _obscurePassword,
            style: const TextStyle(color: AppColors.textFieldText),
            decoration: _buildInputDecoration(
              'Повторите пароль',
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

          // Ошибка
          if (widget.viewModel.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.viewModel.error!,
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
              final email = widget.viewModel.emailController.text.trim();
              final password = widget.viewModel.passwordController.text.trim();
              final confirmPassword = confirmController.text.trim();

              if (password.isEmpty || confirmPassword.isEmpty) {
                widget.viewModel.setError('Заполните все поля');
                return;
              }

              if (password.length < 6) {
                widget.viewModel.setError('Пароль должен быть не короче 6 символов');
                return;
              }

              if (password != confirmPassword) {
                widget.viewModel.setError('Пароли не совпадают');
                return;
              }

              widget.viewModel.setError(null);
              widget.viewModel.register(email, password);
            },
          ),

          const SizedBox(height: 10),

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
