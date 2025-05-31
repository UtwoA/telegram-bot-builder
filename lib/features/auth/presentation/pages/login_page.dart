import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';
import '../widgets/login_form.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/custom_image.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = AuthRepository(AuthApi(), AuthPrefs());

    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(repository),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<AuthViewModel>(context);

          // Автоматический переход при авторизации
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.isAuthenticated && context.mounted) {
              Navigator.pushReplacementNamed(context, '/main');
            }
          });

          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;

          return Scaffold(
            backgroundColor: const Color(0xFF242F3D),
            body: Stack(
              children: [
                // Градиентный фон верхней части
                Container(
                  height: screenHeight * 0.3,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF41ACE4),
                        Color(0xFF242F3D),
                      ],
                    ),
                  ),
                ),

                // Основной контент — теперь без Center, но с padding сверху
                Container(
                  padding: EdgeInsets.only(top: screenHeight * 0.01), // 10% от высоты экрана сверху
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Логотип Telegram
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/icon207.png',
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                        ),
                      ),

                      // Текст приветствия
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextWidget(
                          text: 'Добро пожаловать!',
                          textcolor: Colors.white,
                          textsize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Вкладки: Вход / Регистрация
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: CustomButton(
                              buttontext: 'Вход',
                              width: screenWidth * 0.095,
                              height: screenHeight * 0.05,
                              bordercolor: const Color(0xFF41ACE4),
                              borderradius: 20,
                              fontsize: 12,
                              fontweight: FontWeight.bold,
                              fontcolor: Colors.white,
                              containercolor: const Color(0xFF17212B),
                              onPressed: () {
                                viewModel.clearError();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: CustomButton(
                              buttontext: 'Регистрация',
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.05,
                              bordercolor: const Color(0xFF41ACE4),
                              borderradius: 20,
                              fontsize: 12,
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

                      const SizedBox(height: 32),

                      // Форма входа — растягивается и может скроллиться
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: LoginForm(viewModel: viewModel),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}