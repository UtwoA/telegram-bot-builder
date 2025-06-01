import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';

class RegisterFormMobile extends StatefulWidget {
  final AuthViewModel viewModel;

  const RegisterFormMobile({Key? key, required this.viewModel}) : super(key: key);

  @override
  _RegisterFormMobileState createState() => _RegisterFormMobileState();
}

class _RegisterFormMobileState extends State<RegisterFormMobile> {
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
        horizontal: AppDimensions.percentWidth(context, 0.04),
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontalFormMobile(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Email
            TextField(
              controller: widget.viewModel.emailController,
              style: const TextStyle(color: AppColors.textFieldText),
              decoration: _buildInputDecoration('Email'),
            ),

            SizedBox(height: AppDimensions.gapBetweenFieldsMobile(context)),

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

            SizedBox(height: AppDimensions.gapBetweenFieldsMobile(context)),

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
            
            SizedBox(height: AppDimensions.gapBetweenFieldsMobile(context)),
            
            // Сообщение об ошибке
            if (widget.viewModel.error != null)
              Padding(
                padding: EdgeInsets.only(top: AppDimensions.gapAfterErrorText(context)),
                child: Text(
                  widget.viewModel.error!,
                  style: AppTextStyles.errorMobile,
                  textAlign: TextAlign.center,
                  
                ),
              ),

            SizedBox(height: AppDimensions.gapAfterErrorTextMobile(context)),


            // Кнопка "Зарегистрироваться"
            CustomButton(
              buttontext: 'Зарегистрироваться',
              width: double.infinity,
              height: AppDimensions.buttonHeightRegisterFormMobile(context).clamp(
                AppDimensions.minButtonHeightMobile,
                double.infinity,
              ),
              borderradius: 20,
              bordercolor: AppColors.primary,
              fontsize: AppDimensions.buttonTextSizeFormMobile(context),
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

            SizedBox(height: AppDimensions.gapBetweenButtonsMobile(context)),
            SizedBox(height: AppDimensions.gapBetweenButtonsMobile(context)),


            // Продолжить с Google
            CustomButton(
              buttontext: 'Продолжить с Google',
              leadingIconPath: 'assets/images/ggl.png',
              width: double.infinity,
              height: AppDimensions.buttonHeightRegisterFormMobile(context).clamp(
                AppDimensions.minButtonHeightMobile,
                double.infinity,
              ),
              bordercolor: Colors.white,
              borderradius: 20,
              fontsize: AppDimensions.buttonTextSizeFormMobile(context),
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: Colors.white,
              onPressed: () {},
            ),

            SizedBox(height: AppDimensions.gapBetweenButtonsMobile(context)),

            // Продолжить с VK
            CustomButton(
              buttontext: 'Продолжить с VK',
              leadingIconPath: 'assets/images/vk.png',
              width: double.infinity,
              height: AppDimensions.buttonHeightRegisterFormMobile(context).clamp(
                AppDimensions.minButtonHeightMobile,
                double.infinity,
              ),
              bordercolor: const Color(0xFF456DBE),
              borderradius: 20,
              fontsize: AppDimensions.buttonTextSizeFormMobile(context),
              fontweight: FontWeight.bold,
              fontcolor: Colors.white,
              containercolor: const Color(0xFF456DBE),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}