import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';

class BotDetailsPage extends StatelessWidget {
  static const routeName = '/bot-settings/details';

  final dynamic bot;

  const BotDetailsPage({Key? key, required this.bot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bot == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Ошибка', style: AppTextStyles.textFieldLabel),
          backgroundColor: AppColors.background,
          elevation: 0,
        ),
        backgroundColor: AppColors.background,
        body: Center(
          child: Text(
            'Бот не найден',
            style: AppTextStyles.textFieldLabel,
          ),
        ),
      );
    }

    // === Контроллеры для редактирования ===
    final nameController = TextEditingController(text: bot.name);
    final descriptionController =
        TextEditingController(text: bot.description ?? '');
    final tokenController =
        TextEditingController(text: bot.token ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Назад', style: AppTextStyles.textFieldLabel),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // === Информация о боте ===
          _buildSectionTitle("Основная информация"),
          const SizedBox(height: 16),
          _buildTextField("Имя", nameController),
          const SizedBox(height: 8),
          _buildTextField("Описание", descriptionController),
          const SizedBox(height: 8),
          _buildTextField("Telegram токен", tokenController),

          const SizedBox(height: 12),

          // === Кнопки действий ===
          _buildButton(
            "Сохранить изменения",
            onPressed: () {
              final updatedBot = bot.copyWith(
                name: nameController.text,
                description: descriptionController.text,
                token: tokenController.text,
              );
              Navigator.of(context).pop(updatedBot);
            },
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          _buildButton(
            "Удалить",
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: AppColors.cardBackground,
                  title: Text(
                    "Удалить бота",
                    style: AppTextStyles.textFieldLabel,
                  ),
                  content: Text(
                    "Вы уверены, что хотите удалить этого бота?",
                    style: AppTextStyles.textFieldLabel,
                  ),
                  actions: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text(
                        "Отмена",
                        style: AppTextStyles.textFieldLabel?.copyWith(color: AppColors.primary),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop(); // Закрыть модалку и страницу
                      },
                      child: Text(
                        "Удалить",
                        style: AppTextStyles.button.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
            color: Colors.red,
),
          ],
        ),
      ),
    );
  }

  // === Вспомогательные методы ===

  Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Center(
      child: Text(
        title,
        style: AppTextStyles.textFieldLabel?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _buildTextField(String label, TextEditingController controller) {
  return LayoutBuilder(
    builder: (context, _) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      // Адаптируем ширину
      final isLargeScreen = screenWidth > 600;
      final widthPercent = isLargeScreen ? 30.0 : 50.0;
      final heightPercent = isLargeScreen ? 7.0 : 6.0;

      final calculatedWidth = screenWidth * widthPercent / 100;
      final calculatedHeight = screenHeight * heightPercent / 100;

      return Align(
        alignment: Alignment.center,
        child: Container(
          width: calculatedWidth,
          height: calculatedHeight,
          constraints: BoxConstraints(
            minWidth: calculatedWidth,
            maxWidth: calculatedWidth,
            minHeight: calculatedHeight,
            maxHeight: calculatedHeight,
          ),
          child: TextField(
            controller: controller,
            style: AppTextStyles.textFieldText,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: AppTextStyles.textFieldHint,
              filled: true,
              fillColor: AppColors.textFieldFill,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      );
    },
  );
}

  Widget _buildButton(String text,
      {required VoidCallback? onPressed, Color? color}) {
    return LayoutBuilder(
      builder: (context, _) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        final isLargeScreen = screenWidth > 600;
        final widthPercent = isLargeScreen ? 15.0 : 45.0;
        final heightPercent = isLargeScreen ? 3.0 : 4.0;

        final calculatedWidth = screenWidth * widthPercent / 100;
        final calculatedHeight = screenHeight * heightPercent / 100;

        return Align(
          alignment: Alignment.center,
          child: Container(
            width: calculatedWidth,
            height: calculatedHeight,
            constraints: BoxConstraints(
              minWidth: calculatedWidth,
              maxWidth: calculatedWidth,
              minHeight: calculatedHeight,
              maxHeight: calculatedHeight,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color ?? AppColors.primary,
                foregroundColor: AppColors.secondary,
                textStyle: AppTextStyles.button?.copyWith(fontSize: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        );
      },
    );
  }
}