import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_bot_builder/features/auth/presentation/auth_view_model.dart';
import 'widgets/login_form.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/custom_image.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/core/widgets/wsized.dart';
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

          return Scaffold(
            backgroundColor: const Color(0xFF242F3D),
            body: Column(
              children: [
                // Верхняя часть
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    const CustomImageWidget(
                      height: 0.35264054514,
                      width: 1,
                      imgpath: 'assets/images/reg_up.jpg',
                    ),
                    const CustomImageWidget(
                      height: 0.35264054514,
                      width: 0.22898230088,
                      imgpath: 'assets/images/207.png',
                    ),
                  ],
                ),

                // Форма входа
                Expanded(
                  child: _buildLoginForm(context, viewModel),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, AuthViewModel viewModel) {
    return Center(
      child: Container(
        width: 440,
        height: 440,
        decoration: BoxDecoration(
          color: const Color(0xFF17212B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            WSizedBox(wval: 0, hval: 0.02),

            // Заголовок
            TextWidget(
              text: 'Добро пожаловать!',
              textcolor: const Color(0xFFD9D9D9),
              textsize: 16,
              fontWeight: FontWeight.normal,
            ),

            // Вкладки: Вход / Регистрация
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: CustomButton(
                    buttontext: 'Вход',
                    width: 0.1,
                    height: 0.05,
                    bordercolor: const Color(0xFF41ACE4),
                    borderradius: 12,
                    fontsize: 12,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    containercolor: const Color(0xFF41ACE4),
                    onPressed: () {
                      viewModel.clearError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: CustomButton(
                    buttontext: 'Регистрация',
                    width: 0.1,
                    height: 0.05,
                    bordercolor: const Color(0xFF17212B),
                    borderradius: 12,
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

            // Форма
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
              child: LoginForm(viewModel: viewModel),
            ),
          ],
        ),
      ),
    );
  }
}