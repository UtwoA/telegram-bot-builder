// lib/core/features/platform_settings/pages/platform_settings_page.dart

import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/theme/app_text_styles.dart';

class PlatformSettingsPage extends StatelessWidget {
  const PlatformSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Раздел: Интеграции
            _buildExpansionTile(
              context,
              title: "🔗 Интеграции",
              children: [
                _buildIntegrationSetting(
                  context,
                  title: "Google Sheets",
                  description: "API Key",
                  value: true,
                  onChanged: (val) {},
                ),
                _buildIntegrationSetting(
                  context,
                  title: "Airtable",
                  description: "API Key",
                  value: false,
                  onChanged: (val) {},
                ),
                _buildIntegrationSetting(
                  context,
                  title: "OpenWeather",
                  description: "API Key",
                  value: false,
                  onChanged: (val) {},
                ),
                _buildIntegrationSetting(
                  context,
                  title: "Stripe",
                  description: "Secret Key",
                  value: false,
                  onChanged: (val) {},
                ),
                _buildIntegrationSetting(
                  context,
                  title: "Trello",
                  description: "Token",
                  value: false,
                  onChanged: (val) {},
                ),
              ],
            ),

            // Раздел: Производительность
            _buildExpansionTile(
              context,
              title: "🚀 Производительность",
              children: [
                SwitchListTile(
                  title: Text("Сжимать изображения и медиа при загрузке", style: AppTextStyles.textFieldLabel),
                  activeColor: AppColors.primary,
                  value: true,
                  onChanged: (val) {},
                ),
              ],
            ),

            // Раздел: Резервное копирование
            _buildExpansionTile(
              context,
              title: "💾 Резервное копирование",
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.secondary,
                    textStyle: AppTextStyles.button,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    // Указываем нужный размер кнопки
                    fixedSize: const Size(300, 40), // ← Меняйте width и height как нужно
                  ),
                  onPressed: () {},
                  child: Text("Создать резервную копию"),
                ),
                const SizedBox(height: 16),
                Text("Последняя копия: 01.04.2025, 14:30", style: AppTextStyles.textFieldLabel),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.secondary,
                    textStyle: AppTextStyles.button,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    // Пример с полной шириной
                    fixedSize: const Size(300, 40),
                  ),
                  onPressed: () {},
                  child: Text("Скачать резервную копию"),
                ),
                const SizedBox(height: 16),
              ],
            ),

            // Раздел: Интерфейс
            _buildExpansionTile(
              context,
              title: "🎨 Интерфейс",
              children: [
                ListTile(
                  title: Text("Тема", style: AppTextStyles.textFieldLabel),
                  subtitle: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    dropdownColor: AppColors.cardBackground,
                    value: "light",
                    items: [
                      DropdownMenuItem(
                        value: "light",
                        child: Text("Светлая", style: AppTextStyles.textFieldLabel),
                      ),
                      DropdownMenuItem(
                        value: "dark",
                        child: Text("Темная", style: AppTextStyles.textFieldLabel),
                      ),
                    ],
                    onChanged: (val) {},
                  ),
                ),
                SwitchListTile(
                  title: Text("Использовать десктопный режим", style: AppTextStyles.textFieldLabel),
                  activeColor: AppColors.primary,
                  value: true,
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  title: Text("Анимации", style: AppTextStyles.textFieldLabel),
                  activeColor: AppColors.primary,
                  value: true,
                  onChanged: (val) {},
                ),
              ],
            ),

            // Раздел: Сервер
            _buildExpansionTile(
              context,
              title: "🧰 Сервер",
              children: [
                Text("Состояние ботов: ✔ Все онлайн", style: AppTextStyles.textFieldLabel),
                Text("Последнее обновление: 01.04.2025, 14:29", style: AppTextStyles.textFieldLabel),
              ],
            ),

            // Раздел: Хранение данных
            _buildExpansionTile(
              context,
              title: "📁 Хранение данных",
              children: [
                SwitchListTile(
                  title: Text("Автоочистка медиа", style: AppTextStyles.textFieldLabel),
                  activeColor: AppColors.primary,
                  value: true,
                  onChanged: (val) {},
                ),
                Text("Занято места: 2.4 ГБ из 10 ГБ", style: AppTextStyles.textFieldLabel),
              ],
            ),

            // Раздел: Политики и документация
            _buildExpansionTile(
              context,
              title: "📄 Политики и документация",
              children: [
                ListTile(
                  title: Text("Политика конфиденциальности", style: AppTextStyles.link),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Пользовательское соглашение", style: AppTextStyles.link),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Документация по API", style: AppTextStyles.link),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("GitHub репозиторий", style: AppTextStyles.link),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(BuildContext context, {required String title, required List<Widget> children}) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.secondary)),
      collapsedIconColor: AppColors.secondary,
      iconColor: AppColors.primary,
      textColor: AppColors.secondary,
      children: children.map((child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: child,
      )).toList(),
    );
  }

  Widget _buildIntegrationSetting(
    BuildContext context, {
    required String title,
    required String description,
    required bool value,
    required void Function(bool?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(title, style: AppTextStyles.textFieldLabel),
            ),
            Switch(
              activeColor: AppColors.primary,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            labelText: description,
            labelStyle: AppTextStyles.textFieldHint,
            filled: true,
            fillColor: AppColors.textFieldFill,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}