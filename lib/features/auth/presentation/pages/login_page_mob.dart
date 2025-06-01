import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';
import '../widgets/login_form.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';

class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = AuthRepository(AuthApi(), AuthPrefs());

    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(repository),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<AuthViewModel>(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.isAuthenticated && context.mounted) {
              Navigator.pushReplacementNamed(context, '/main');
            }
          });

          final screenWidth = MediaQuery.of(context).size.width;

          return Scaffold(
            backgroundColor: const Color(0xFF242F3D),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Логотип
                    Center(
                      child: Image.asset(
                        'assets/images/icon207.png',
                        width: screenWidth * 0.3,
                        height: screenWidth * 0.3,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Приветствие
                    Center(child:  TextWidget(
                      text: 'Добро пожаловать!',
                      textcolor: Colors.white,
                      textsize: 22,
                      fontWeight: FontWeight.bold,
                    )),

                    const SizedBox(height: 32),

                    // Кнопки Вход / Регистрация
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttontext: 'Вход',
                            width: double.infinity,
                            height: 48,
                            bordercolor: const Color(0xFF41ACE4),
                            borderradius: 12,
                            fontsize: 14,
                            fontweight: FontWeight.bold,
                            fontcolor: Colors.white,
                            containercolor: const Color(0xFF17212B),
                            onPressed: () {
                              viewModel.clearError();
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomButton(
                            buttontext: 'Регистрация',
                            width: double.infinity,
                            height: 48,
                            bordercolor: const Color(0xFF41ACE4),
                            borderradius: 12,
                            fontsize: 14,
                            fontweight: FontWeight.bold,
                            fontcolor: Colors.white,
                            containercolor: const Color(0xFF41ACE4),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/register");
                              viewModel.clearError();
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Форма входа
                    LoginForm(viewModel: viewModel),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
