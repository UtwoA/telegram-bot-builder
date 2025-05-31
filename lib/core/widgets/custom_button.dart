import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttontext;
  final double width;
  final double height;
  final Color bordercolor;
  final double borderradius;
  final double fontsize;
  final FontWeight fontweight;
  final Color fontcolor;
  final VoidCallback? onPressed;
  final String? leadingIconPath;
  final IconData? icon;
  final Color? iconColor;
  final Color containercolor;

  const CustomButton({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: containercolor,
          foregroundColor: fontcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderradius),
            side: BorderSide(color: bordercolor),
          ),
          padding: EdgeInsets.zero, // убираем внутренние отступы
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.center,
          fixedSize: Size(width, height), // фиксируем размер
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIconPath != null)
              Image.asset(
                leadingIconPath!,
                width: fontsize + 4,
                height: fontsize + 4,
                color: iconColor,
              ),
            if (icon != null && leadingIconPath == null)
              Icon(
                icon,
                size: fontsize + 4,
                color: iconColor ?? Colors.white,
              ),
            if (leadingIconPath != null || icon != null)
              SizedBox(width: fontsize.toDouble()), // адаптивный отступ
            Text(
              buttontext,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
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