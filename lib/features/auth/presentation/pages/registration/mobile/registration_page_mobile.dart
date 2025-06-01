import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/features/auth/presentation/pages/auth_view_model.dart';
import 'package:telegram_bot_builder/features/auth/data/auth_repository.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_api.dart';
import 'package:telegram_bot_builder/features/auth/dao/auth_prefs.dart';
import 'package:telegram_bot_builder/features/auth/presentation/widgets/registration_form_mobile.dart';

class RegistrationPageMobile extends StatelessWidget {
  const RegistrationPageMobile({super.key});

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

          return Scaffold(
            backgroundColor: const Color(0xFF242F3D),
            body: SafeArea(
              child: Stack(
                children: [
                  // Градиентный фон верхней части
                  Container(
                    height: AppDimensions.percentHeight(context, 0.25),
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
                  Padding(
                    padding: EdgeInsets.only(top: AppDimensions.percentHeight(context, 0.05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Логотип Telegram
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/icon207.png',
                            width: AppDimensions.logoSizeMobile(context),
                            height: AppDimensions.logoSizeMobile(context),
                          ),
                        ),

                        // Текст приветствия
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.paddingVerticalWelcomeTextMobile(context),
                          ),
                          child: TextWidget(
                            text: 'Добро пожаловать!',
                            textcolor: Colors.white,
                            textsize: AppDimensions.welcomeTextSizeMobile(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: AppDimensions.gapAfterTitleMobile(context)),

                        // Вкладки: Вход / Регистрация
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLoginButton(context),
                            _buildRegisterButton(context),
                          ],
                        ),

                        SizedBox(height: AppDimensions.gapAfterButtonsMobile(context)),

                        // Форма регистрации — растягивается и может скроллиться
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.paddingHorizontalFormMobile(context),
                            ),
                            child: RegisterFormMobile(viewModel: viewModel),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = AppDimensions.buttonWidthLoginMobile(context).clamp(
              AppDimensions.minButtonWidthMobile,
              double.infinity,
            );
        final height = AppDimensions.buttonHeightMobile(context).clamp(
              AppDimensions.minButtonHeightMobile,
              double.infinity,
            );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingBetweenButtonsMobile(context)),
          child: CustomButton(
            buttontext: 'Вход',
            width: width,
            height: height,
            bordercolor: const Color(0xFF41ACE4),
            borderradius: 20,
            fontsize: AppDimensions.buttonTextSizeMobile(context),
            fontweight: FontWeight.bold,
            fontcolor: Colors.white,
            containercolor: const Color(0xFF41ACE4),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
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
        final width = AppDimensions.buttonWidthRegisterMobile(context).clamp(
              AppDimensions.minButtonWidthMobile,
              double.infinity,
            );
        final height = AppDimensions.buttonHeightMobile(context).clamp(
              AppDimensions.minButtonHeightMobile,
              double.infinity,
            );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingBetweenButtonsMobile(context)),
          child: CustomButton(
            buttontext: 'Регистрация',
            width: width,
            height: height,
            bordercolor: const Color(0xFF41ACE4),
            borderradius: 20,
            fontsize: AppDimensions.buttonTextSizeMobile(context),
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
}