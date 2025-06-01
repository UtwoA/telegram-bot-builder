import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/services/bot.dart';
import 'package:telegram_bot_builder/core/services/bot_storage.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';

class AddBotPage extends StatefulWidget {
  const AddBotPage({Key? key}) : super(key: key);

  @override
  State<AddBotPage> createState() => _AddBotPageState();
}

class _AddBotPageState extends State<AddBotPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tokenController = TextEditingController();

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Добавить нового бота",
              style: AppTextStyles.textFieldLabel?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _nameController,
              style: AppTextStyles.textFieldText,
              decoration: InputDecoration(
                labelText: 'Имя бота',
                labelStyle: AppTextStyles.textFieldHint,
                filled: true,
                fillColor: AppColors.textFieldFill,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите имя бота';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              style: AppTextStyles.textFieldText,
              decoration: InputDecoration(
                labelText: 'Описание',
                labelStyle: AppTextStyles.textFieldHint,
                filled: true,
                fillColor: AppColors.textFieldFill,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _tokenController,
              style: AppTextStyles.textFieldText,
              decoration: InputDecoration(
                labelText: 'Токен Telegram',
                labelStyle: AppTextStyles.textFieldHint,
                filled: true,
                fillColor: AppColors.textFieldFill,
              ),
            ),
            const SizedBox(height: 24),

            // === Кнопки с управлением положением и размером ===
            _buildButton("Сохранить", onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                final newBot = Bot(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  token: _tokenController.text,
                  status: true,
                );
                Navigator.of(context).pop(newBot);
              } else {
                setState(() {
                  _autoValidate = true;
                });
              }
            }, widthPercent: 10, heightPercent: 4, alignment: Alignment.center),

            const SizedBox(height: 16),

            _buildButton("Отмена", onPressed: Navigator.of(context).pop,
                widthPercent: 10, heightPercent: 4, alignment: Alignment.center),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    String text, {
    required VoidCallback? onPressed,
    double? widthPercent,
    double? heightPercent,
    AlignmentGeometry alignment = Alignment.centerLeft,
    Color? color,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final calculatedWidth = widthPercent != null
        ? (screenWidth * widthPercent / 100)
        : double.infinity;
    final calculatedHeight = heightPercent != null
        ? (screenHeight * heightPercent / 100)
        : null;

    return Align(
      alignment: alignment,
      child: Container(
        width: calculatedWidth,
        height: calculatedHeight,
        constraints: BoxConstraints(
          minWidth: calculatedWidth,
          maxWidth: calculatedWidth,
          minHeight: calculatedHeight ?? 0,
          maxHeight: calculatedHeight ?? double.infinity,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.primary,
            foregroundColor: AppColors.secondary,
            textStyle: AppTextStyles.button,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
    if (_formKey.currentState?.validate() == true) {
      final newBot = Bot(
        name: _nameController.text,
        description: _descriptionController.text,
        token: _tokenController.text,
        status: true,
          );
          // Добавляем бота в временное хранилище
          BotStorage().bots.add(newBot);

          Navigator.of(context).pop(newBot);
        } else {
          setState(() {
            _autoValidate = true;
              });
            }
          },
          child: Text(text),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _tokenController.dispose();
    super.dispose();
  }
}