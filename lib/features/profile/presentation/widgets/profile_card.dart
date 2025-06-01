import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'helper_widgets.dart';
import 'custom_dialogs.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _showCross = true;

  void _toggleCross() {
    setState(() {
      _showCross = !_showCross;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = screenWidth * 0.1;
    final buttonHeight = screenHeight * 0.03;

    return SizedBox(
      width: screenWidth * 0.4,
      height: screenHeight * 0.6,
      child: Card(
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
              const SizedBox(height: 4),
              buildInputField('user', enabled: true, hintSize: 14),
              const SizedBox(height: 8),
              const Text('Эл. почта', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              buildInputField('user@example.com', enabled: false, hintSize: 14),
              const SizedBox(height: 8),
              const Text('Telegram username', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              buildInputField('@username', enabled: false, hintSize: 14),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить Telegram',
                  width: buttonWidth,
                  height: buttonHeight,
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: 14,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () => showChangeTelegramDialog(context),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить Email',
                  width: buttonWidth,
                  height: buttonHeight,
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: 14,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () => showChangeEmailDialog(context),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить пароль',
                  width: buttonWidth,
                  height: buttonHeight,
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: 14,
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () => showChangePasswordDialog(context),
                ),
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
      ),
    );
  }
}