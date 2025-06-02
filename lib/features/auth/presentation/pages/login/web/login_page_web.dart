import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';
import 'package:telegram_bot_builder/features/auth/presentation/widgets/login/login_form_web.dart';

class LoginPageWeb extends StatelessWidget {
  const LoginPageWeb({super.key});

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
              Navigator.pushReplacementNamed(context, '/main',arguments: {'email':viewModel.EEmail,'token':viewModel.TToken});
            }
          });

          return Scaffold(
            backgroundColor: const Color(0xFF242F3D),
            body: Stack(
              children: [
                // Градиентный фон верхней части
                Container(
                  height: AppDimensions.percentHeight(context, 0.3),
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

                // Основной контент
                Container(
                  padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.03)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Логотип Telegram
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/icon207.png',
                          width: AppDimensions.logoSize(context),
                          height: AppDimensions.logoSize(context),
                        ),
                      ),

                      // Текст приветствия
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingVerticalWelcomeText(context),
                        ),
                        child: TextWidget(
                          text: 'Добро пожаловать!',
                          textcolor: Colors.white,
                          textsize: AppDimensions.welcomeTextSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: AppDimensions.gapAfterTitle(context)),

                      // Вкладки: Вход / Регистрация
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLoginButton(context),
                          _buildRegisterButton(context),
                        ],
                      ),

                      SizedBox(height: AppDimensions.gapAfterButtons(context)),

                      // Форма входа — растягивается и может скроллиться
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingHorizontalForm(context),
                          ),
                          child: LoginFormWeb(viewModel: viewModel),
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

  Widget _buildLoginButton(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = AppDimensions.buttonWidthLogin(context).clamp(
              AppDimensions.minButtonWidth,
              double.infinity,
            );
        final height = AppDimensions.buttonHeight(context).clamp(
              AppDimensions.minButtonHeight,
              double.infinity,
            );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingBetweenButtons(context)),
          child: CustomButton(
            buttontext: 'Вход',
            width: width,
            height: height,
            bordercolor: const Color(0xFF41ACE4),
            borderradius: 20,
            fontsize: AppDimensions.buttonTextSize(context),
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            containercolor: const Color(0xFF17212B),
            onPressed: () {
              Provider.of<AuthViewModel>(context, listen: false).clearError();
            },
          ),
        );
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = AppDimensions.buttonWidthRegister(context).clamp(
              AppDimensions.minButtonWidth,
              double.infinity,
            );
        final height = AppDimensions.buttonHeight(context).clamp(
              AppDimensions.minButtonHeight,
              double.infinity,
            );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingBetweenButtons(context)),
          child: CustomButton(
            buttontext: 'Регистрация',
            width: width,
            height: height,
            bordercolor: const Color(0xFF17212B),
            borderradius: 20,
            fontsize: AppDimensions.buttonTextSize(context),
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            containercolor: const Color(0xFF41ACE4),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/register");
              Provider.of<AuthViewModel>(context, listen: false).clearError();
            },
          ),
        );
      },
    );
  }
}