import 'package:flutter/material.dart';
import 'package:telegram_bot_builder/core/theme/app_colors.dart';
import 'package:telegram_bot_builder/core/widgets/app_dimensions.dart';
import 'package:telegram_bot_builder/core/widgets/custom_button.dart';
import 'package:telegram_bot_builder/features/profile/presentation/widgets/helper_widgets.dart'; // Импортируем AppDimensions

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.statsCardWidth(context),
      height: AppDimensions.statsCardHeight(context),
      child: Card(
        color: AppColors.textFieldFill,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.percentWidth(context, 0.01)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Статистика',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.statsTitleSize(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimensions.statsTextSize(context) * 0.9,
                    color: Colors.white70,
                  ),
                ],
              ),
              WSizedBox(wval: 0, hval: 0.01), // ~1% высоты
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A394F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '📈 График скоро появится',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: AppDimensions.statsTextSize(context),
                    ),
                  ),
                ),
              ),
              WSizedBox(wval: 0, hval: 0.015), // ~1.5%
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  buttontext: 'К полной статистике',
                  width: AppDimensions.statsButtonWidth(context),
                  height: AppDimensions.statsButtonHeight(context),
                  borderradius: 10,
                  bordercolor: AppColors.buttonBorder,
                  fontsize: AppDimensions.statsTextSize(context),
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                  containercolor: AppColors.buttonBorder,
                  onPressed: () {},
                ),
              ),
              WSizedBox(wval: 0, hval: 0.01), // ~1%
            ],
          ),
        ),
      ),
    );
  }
}