import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
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
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: AppDimensions.profileCardWidthFromSize(screenSize),
      height: AppDimensions.profileCardHeightFromSize(screenSize),
      child: Card(
        color: AppColors.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.percentWidthFromSize(screenSize, 0.01)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Профиль',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTitleSizeFromSize(screenSize),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.white12),
              Text(
                'Имя',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTextSizeFromSize(screenSize),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.005),
              buildInputField('user', enabled: true, hintSize: AppDimensions.profileTextSizeFromSize(screenSize)),
              WSizedBox(wval: 0, hval: 0.007),
              Text(
                'Эл. почта',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTextSizeFromSize(screenSize),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.005),
              buildInputField('user@example.com', enabled: false, hintSize: AppDimensions.profileTextSizeFromSize(screenSize)),
              WSizedBox(wval: 0, hval: 0.007),
              Text(
                'Telegram username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTextSizeFromSize(screenSize),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.005),
              buildInputField('@username', enabled: false, hintSize: AppDimensions.profileTextSizeFromSize(screenSize)),
              WSizedBox(wval: 0, hval: 0.015),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить Telegram',
                  width: AppDimensions.profileButtonWidthFromSize(screenSize),
                  height: AppDimensions.profileButtonHeightFromSize(screenSize),
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.profileTextSizeFromSize(screenSize),
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {
                    showChangeTelegramDialog(context);},
                ),
              ),
              WSizedBox(wval: 0, hval: 0.015),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить Email',
                  width: AppDimensions.profileButtonWidthFromSize(screenSize),
                  height: AppDimensions.profileButtonHeightFromSize(screenSize),
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.profileTextSizeFromSize(screenSize),
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () => showChangeEmailDialog(context),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.015),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить пароль',
                  width: AppDimensions.profileButtonWidthFromSize(screenSize),
                  height: AppDimensions.profileButtonHeightFromSize(screenSize),
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.profileTextSizeFromSize(screenSize),
                  fontweight: FontWeight.normal,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () => showChangePasswordDialog(context),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.015),
              GestureDetector(
                onTap: _toggleCross,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: AppDimensions.percentWidthFromSize(screenSize, 0.016),
                      height: AppDimensions.percentWidthFromSize(screenSize, 0.016),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFill,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white30),
                      ),
                      child: Center(
                        child: _showCross
                            ? Icon(
                                Icons.check,
                                size: AppDimensions.percentWidthFromSize(screenSize, 0.015),
                                color: Colors.white,
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    WSizedBox(wval: 0.01, hval: 0),
                    Text(
                      'Получать уведомления',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.profileTextSizeFromSize(screenSize),
                      ),
                    ),
                  ],
                ),
              ),
              WSizedBox(wval: 0, hval: 0.01),
            ],
          ),
        ),
      ),
    );
  }
}