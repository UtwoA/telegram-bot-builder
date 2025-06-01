import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';

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
      contentPadding: EdgeInsets.symmetric(
        vertical: AppDimensions.percentHeight(context, 0.015),
        horizontal: AppDimensions.percentWidth(context, 0.02),
      ),
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
      child: Column(
        children: <Widget>[
          // Поле Email
          SizedBox(
            width: AppDimensions.textFieldWidth(context),
            child: TextField(
              controller: widget.viewModel.emailController,
              style: const TextStyle(color: AppColors.textFieldText),
              decoration: _buildInputDecoration('Email'),
            ),
          ),

          SizedBox(height: AppDimensions.gapBetweenFields(context)),

          // Пароль
          SizedBox(
            width: AppDimensions.textFieldWidth(context),
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

          SizedBox(height: AppDimensions.gapBetweenFields(context)),

          // Повторите пароль
          SizedBox(
            width: AppDimensions.textFieldWidth(context),
            child: TextField(
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
          ),

          // Сообщение об ошибке
          if (widget.viewModel.error != null)
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.gapAfterErrorText(context)),
              child: Text(
                widget.viewModel.error!,
                style: AppTextStyles.error,
                textAlign: TextAlign.center,
              ),
            ),

          SizedBox(height: AppDimensions.gapAfterErrorText(context)),

          // Кнопка "Зарегистрироваться"
          CustomButton(
            buttontext: 'Зарегистрироваться',
            width: AppDimensions.textFieldWidth(context),
            height: AppDimensions.buttonHeightLogin(context).clamp(
              AppDimensions.minButtonHeight,
              double.infinity,
            ),
            borderradius: 20,
            bordercolor: AppColors.primary,
            fontsize: AppDimensions.welcomeTextSize(context),
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            containercolor: AppColors.primary,
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

          SizedBox(height: AppDimensions.gapBetweenButtons(context)),

          // Продолжить с Google
          CustomButton(
            buttontext: 'Продолжить с Google',
            leadingIconPath: 'assets/images/ggl.png',
            width: AppDimensions.textFieldWidth(context),
            height: AppDimensions.buttonHeightLogin(context).clamp(
              AppDimensions.minButtonHeight,
              double.infinity,
            ),
            bordercolor: Colors.white,
            borderradius: 20,
            fontsize: AppDimensions.welcomeTextSize(context),
            fontweight: FontWeight.bold,
            fontcolor: Colors.black,
            containercolor: Colors.white,
            onPressed: () {},
          ),

          SizedBox(height: AppDimensions.gapBetweenButtons(context)),

          // Продолжить с VK
          CustomButton(
            buttontext: 'Продолжить с VK',
            leadingIconPath: 'assets/images/vk.png',
            width: AppDimensions.textFieldWidth(context),
            height: AppDimensions.buttonHeightLogin(context).clamp(
              AppDimensions.minButtonHeight,
              double.infinity,
            ),
            bordercolor: const Color(0xFF456DBE),
            borderradius: 20,
            fontsize: AppDimensions.welcomeTextSize(context),
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