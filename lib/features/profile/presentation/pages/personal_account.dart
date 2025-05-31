
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';

class WSizedBox extends StatelessWidget {
  var wval = 0.0;
  var hval = 0.0;
  WSizedBox({
    super.key,
    required this.wval,
    required this.hval,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * wval,
      height: MediaQuery.of(context).size.height * hval,
    );
  }
}

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

  void _showChangeTelegramDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _buildDialog(
        context,
        title: 'Сменить Telegram аккаунт',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInputField('Новый логин'),
            WSizedBox(wval: 0, hval: 0.01),
            _buildInputField('Код подтверждения'),
            WSizedBox(wval: 0, hval: 0.02),
            CustomButton(
              buttontext: 'Сохранить',
              width: 0.1,
              height: 0.05,
              borderradius: 10,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _buildDialog(
        context,
        title: 'Сменить пароль',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInputField('Старый пароль', obscureText: true),
            WSizedBox(wval: 0, hval: 0.01),
            _buildInputField('Новый пароль', obscureText: true),
            WSizedBox(wval: 0, hval: 0.01),
            _buildInputField('Повторите пароль', obscureText: true),
            WSizedBox(wval: 0, hval: 0.02),
            CustomButton(
              buttontext: 'Сохранить',
              width: 0.1,
              height: 0.05,
              borderradius: 10,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _buildDialog(
        context,
        title: 'Сменить Email',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInputField('Пароль', obscureText: true),
            WSizedBox(wval: 0, hval: 0.01),
            _buildInputField('Новый Email'),
            WSizedBox(wval: 0, hval: 0.02),
            CustomButton(
              buttontext: 'Сменить Email',
              width: 0.1,
              height: 0.05,
              borderradius: 10,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context, {required String title, required Widget child}) {
    return Dialog(
      backgroundColor: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
          minWidth: 300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText, {bool obscureText = false}) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldFill,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E1621),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHelpCenterCard(context),
                  const SizedBox(height: 16),
                  _buildStatsCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            const Text('Telegram username', style: TextStyle(color: Colors.white)),
            _buildInputField('@username'),
            const SizedBox(height: 12),
            CustomButton(
              buttontext: 'Сменить Telegram',
              width: 0.1,
              height: 0.05,
              borderradius: 20,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () => _showChangeTelegramDialog(context),
            ),
            const SizedBox(height: 12),
            CustomButton(
              buttontext: 'Сменить пароль',
              width: 0.1,
              height: 0.05,
              borderradius: 20,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () => _showChangePasswordDialog(context),
            ),
            const SizedBox(height: 12),
            CustomButton(
              buttontext: 'Сменить Email',
              width: 0.1,
              height: 0.05,
              borderradius: 20,
              bordercolor: AppColors.buttonBorder,
              fontsize: 12,
              fontweight: FontWeight.bold,
              fontcolor: Colors.black,
              containercolor: AppColors.buttonBorder,
              onPressed: () => _showChangeEmailDialog(context),
            ),
            const SizedBox(height: 16),
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
                          : const SizedBox.shrink(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Получать уведомления', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
