import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttontext;
  final double width;
  final double height;
  final Color bordercolor; // Цвет контура кнопки
  final double borderradius;
  final double fontsize;
  final FontWeight fontweight;
  final Color fontcolor;
  final VoidCallback? onPressed;
  final Color containercolor; // Цвет фона кнопки
  final String? leadingIconPath; // путь к иконке (например, AssetImage)
  final IconData? icon; // можно удалить, если не используется
  final Color? iconColor;

  const CustomButton({
    Key? key,
    required this.buttontext,
    required this.width,
    required this.height,
    required this.bordercolor,
    required this.borderradius,
    required this.fontsize,
    required this.fontweight,
    required this.fontcolor,
    required this.containercolor,
    this.onPressed,
    this.leadingIconPath,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius),
          side: BorderSide(color: bordercolor), // ⬅️ Контур кнопки
        ),
        color: containercolor, // ⬅️ Фон кнопки
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIconPath != null)
              Image.asset(
                leadingIconPath!,
                width: fontsize + 4,
                height: fontsize + 4,
                color: iconColor, // цвет иконки (если нужен)
              ),
            if (icon != null && leadingIconPath == null)
              Icon(
                icon,
                size: fontsize + 4,
                color: iconColor ?? Colors.white,
              ),
            if (leadingIconPath != null || icon != null)
              const SizedBox(width: 8),
            Text(
              buttontext,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  color: fontcolor,
                  fontSize: fontsize,
                  fontWeight: fontweight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}