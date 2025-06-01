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
        title: Text(bot.name ?? "Бот", style: AppTextStyles.textFieldLabel),
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
            _buildTextField("Имя", nameController,
                widthPercent: 30, heightPercent: 7),
            _buildTextField("Описание", descriptionController,
                widthPercent: 30, heightPercent: 7),
            _buildTextField("Telegram токен", tokenController,
                widthPercent: 30, heightPercent: 7),

            const SizedBox(height: 32),

            // === Кнопки действий ===
            _buildButton(
              "Сохранить изменения",
              onPressed: () {
                final updatedBot = bot.copyWith(
                  name: nameController.text,
                  description: descriptionController.text,
                  token: tokenController.text,
                );
                Navigator.of(context).pop(updatedBot); // ← Закрываем модальное окно и передаем обновленного бота
              },
              widthPercent: 10,
              heightPercent: 4,
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
                          style: AppTextStyles.textFieldLabel
                              ?.copyWith(color: AppColors.primary),
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
              widthPercent: 10,
              heightPercent: 4,
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
      child: Text(
        title,
        style: AppTextStyles.textFieldLabel
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

Widget _buildTextField(String label, TextEditingController controller,
    {double? widthPercent, double? heightPercent}) {
  return LayoutBuilder(
    builder: (context, _) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      final calculatedWidth = widthPercent != null
          ? (screenWidth * widthPercent / 100)
          : double.infinity;
      final calculatedHeight = heightPercent != null
          ? (screenHeight * heightPercent / 100)
          : null;

      return Align(
        alignment: Alignment.center, // можно изменить на center
        child: Container(
          width: calculatedWidth,
          height: calculatedHeight,
          constraints: BoxConstraints(
            minWidth: calculatedWidth,
            maxWidth: calculatedWidth,
            minHeight: calculatedHeight ?? 0,
            maxHeight: calculatedHeight ?? double.infinity,
          ),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.red), // для отладки
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
    {required VoidCallback? onPressed,
    double? widthPercent,
    double? heightPercent,
    Color? color}) {
  return LayoutBuilder(
    builder: (context, _) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      final calculatedWidth = widthPercent != null
          ? (screenWidth * widthPercent / 100)
          : double.infinity;
      final calculatedHeight = heightPercent != null
          ? (screenHeight * heightPercent / 100)
          : null;

      return Align(
        alignment: Alignment.center, // или Alignment.center
        child: Container(
          width: calculatedWidth,
          height: calculatedHeight,
          constraints: BoxConstraints(
            minWidth: calculatedWidth,
            maxWidth: calculatedWidth,
            minHeight: calculatedHeight ?? 0,
            maxHeight: calculatedHeight ?? double.infinity,
          ),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.blue), // для отладки
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColors.primary,
              foregroundColor: AppColors.secondary,
              textStyle: AppTextStyles.button,
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