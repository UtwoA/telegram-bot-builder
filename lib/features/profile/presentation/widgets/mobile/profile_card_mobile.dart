import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/mobile/custom_dialogs_mobile.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/helper_widgets.dart';


class ProfileCardMobile extends StatefulWidget {
  const ProfileCardMobile({super.key,required this.email});
  final String email;
  @override
  State<ProfileCardMobile> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCardMobile> {
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
      width: AppDimensions.percentWidthFromSizeMobile(screenSize, 1),
      height: AppDimensions.percentHeightFromSizeMobile(screenSize, 0.48),
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
                  fontSize: AppDimensions.profileTitleSizeFromSizeMobile(screenSize),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.white12),
              Text(
                'Имя',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.005),
              buildInputField('user', enabled: true, hintSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize)),
              WSizedBox(wval: 0, hval: 0.007),
              Text(
                'Эл. почта',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.005),
              buildInputField(widget.email, enabled: false, hintSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize)),
              WSizedBox(wval: 0, hval: 0.007),
              Text(
                'Telegram username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.005),
              buildInputField('@username', enabled: false, hintSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize)),
              WSizedBox(wval: 0, hval: 0.015),
              Center(
                child: CustomButton(
                  buttontext: 'Сменить Telegram',
                  width: AppDimensions.profileButtonWidthFromSizeMobile(screenSize),
                  height: AppDimensions.profileButtonHeightFromSizeMobile(screenSize),
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
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
                  width: AppDimensions.profileButtonWidthFromSizeMobile(screenSize),
                  height: AppDimensions.profileButtonHeightFromSizeMobile(screenSize),
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
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
                  width: AppDimensions.profileButtonWidthFromSizeMobile(screenSize),
                  height: AppDimensions.profileButtonHeightFromSizeMobile(screenSize),
                  borderradius: 20,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
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
                      width: AppDimensions.percentWidthFromSize(screenSize, 0.06),
                      height: AppDimensions.percentWidthFromSize(screenSize, 0.06),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFill,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white30),
                      ),
                      child: Center(
                        child: _showCross
                            ? Icon(
                                Icons.check,
                                size: AppDimensions.percentWidthFromSize(screenSize, 0.06),
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
                        fontSize: AppDimensions.profileTextSizeFromSizeMobile(screenSize),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}