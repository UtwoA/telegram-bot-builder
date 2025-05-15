import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_view_model.dart';
import 'widgets/register_form.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/widgets/custom_image.dart';
import 'package:telegram_bot_builder/core/widgets/text_widget.dart';
import 'package:telegram_bot_builder/core/widgets/wsized.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFF242F3D),
        body: Column(
          children: [
            // Верхняя часть (шапка с картинкой)
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Фон шапки
                const CustomImageWidget(
                  height: 0.35264054514,
                  width: 1,
                  imgpath: 'assets/images/reg_up.jpg',
                ),

                // Логотип бота
                const CustomImageWidget(
                  height: 0.35264054514,
                  width: 0.22898230088,
                  imgpath: 'assets/images/207.png',
                ),
              ],
            ),

            // Основная форма
            Expanded(
              child: _buildRegisterForm(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);

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
                    bordercolor: const Color(0xFF17212B),
                    borderradius: 12,
                    fontsize: 12,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    containercolor: const Color(0xFF41ACE4),
                    onPressed: () {
                      // Переход на LoginPage
                      Navigator.pushReplacementNamed(context, '/login');
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
                    bordercolor: const Color(0xFF41ACE4),
                    borderradius: 12,
                    fontsize: 12,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.white,
                    containercolor: const Color(0xFF41ACE4),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            // Форма регистрации
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
              child: RegisterForm(viewModel: viewModel),
            ),
          ],
        ),
      ),
    );
  }
}