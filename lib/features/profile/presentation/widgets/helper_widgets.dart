import 'package:flutter/material.dart';

class WSizedBox extends StatelessWidget {
  final double wval;
  final double hval;

  const WSizedBox({
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

Widget buildInputField(
  String hintText, {
  bool obscureText = false,
  double widthFactor = 0.4,
  double height = 35,
  Color fillColor = const Color(0xFFD9D9D9),
  bool enabled = true,
  double textsize = 12,
  double hintSize = 12,
}) {
  return FractionallySizedBox(
    widthFactor: widthFactor,
    child: SizedBox(
      height: height,
      child: TextField(
        obscureText: obscureText,
        enabled: enabled,
        style: TextStyle(
          color: Colors.black,
          fontSize: textsize,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: enabled ? fillColor : fillColor.withOpacity(0.7),
          hintText: hintText,
          hintStyle: TextStyle(
            color: enabled ? Colors.black54 : Colors.black26,
            fontSize: hintSize,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    ),
  );
}

Widget buildHelpLink(String text, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 4),
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/helpcenter');
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        textAlign: TextAlign.left,
      ),
    ),
  );
}