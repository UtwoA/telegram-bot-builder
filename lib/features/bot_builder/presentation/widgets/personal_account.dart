import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class PersonalAccount extends StatefulWidget {
  const PersonalAccount({super.key});

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}
class _PersonalAccountState extends State<PersonalAccount> {
  bool _showCross = true;

  void _toggleCross() {
    setState(() {
      _showCross = !_showCross;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E1621),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 🔹 Левая колонка: Профиль + Тариф
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileCard(context),
                  const SizedBox(height: 16),
                  _buildTariffCard(context),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // 🔸 Правая колонка: Справка + Статистика
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHelpCenterCard(context),
                  const SizedBox(height: 100),
                  _buildStatsCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🟦 1. Профиль пользователя
  Widget _buildProfileCard(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Профиль', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const Divider(color: Colors.white12),
            const Text('Имя', style: TextStyle(color: Colors.white)),
            _buildInputField('user'),
            const SizedBox(height: 8),

            const Text('Эл. почта', style: TextStyle(color: Colors.white)),
            _buildInputField('user@example.com'),
            const SizedBox(height: 8),

            const Text('Telegrame username', style: TextStyle(color: Colors.white)),
            _buildInputField('@user'),
            
            const SizedBox(height: 12),
            
            GestureDetector(
              onTap: _toggleCross,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.textFieldFill,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Center(
                      child: _showCross
                          ? Icon(Icons.close, size: 16, color: Colors.white)
                          : const SizedBox.shrink(), // ❌ Прячем крестик
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Получать уведомления',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            
            CustomButton(
              buttontext: 'Сменить Telegram',
              width: 0.2,
              height: 0.05,
              borderradius: 10,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            // Квадрат с крестиком слева от текста      

            CustomButton(
              buttontext: 'Сменить пароль',
              width: 0.2,
              height: 0.05,
              borderradius: 10,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // 🟥 Виджет поля ввода
  Widget _buildInputField(String hintText) {
    return Padding(padding: const EdgeInsets.fromLTRB(50, 10, 50, 10), child:  TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.buttonBorder,
        labelText: null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      style: const TextStyle(color: Colors.black),
      
    ));
  }

  // 🟨 2. Справочный центр
  Widget _buildHelpCenterCard(BuildContext context) {
    return Card(
      color: AppColors.textFieldFill,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Справочный центр', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
              ],
            ),
            const SizedBox(height: 12),
            _buildHelpLink('Как создать первого бота?'),
            _buildHelpLink('Как создать второго бота?'),
            _buildHelpLink('Как создать второго бота?'),
            _buildHelpLink('Как создать первого бота?'),
          ],
        ),
      ),
    );
  }
  // 🟥 3. Тарифный план
  Widget _buildTariffCard(BuildContext context) {
    return Card(
      color: AppColors.textFieldFill,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Тарифный план', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Free до 01.01.1980', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 12),
            CustomButton(
              buttontext: 'Тарифы',
              width: 0.2,
              height: 0.05,
              borderradius: 10,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
  // 🟩 4. Статистика
  Widget _buildStatsCard(BuildContext context) {
    return Card(
      color: AppColors.textFieldFill,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Статистика', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatItem('Ботов запущено', '3'),
            _buildStatItem('Количество пользователей', '12312'),
            const SizedBox(height: 12),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'График роста активности',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Вспомогательные методы

  Widget _buildHelpLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(alignment: Alignment.centerLeft),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}