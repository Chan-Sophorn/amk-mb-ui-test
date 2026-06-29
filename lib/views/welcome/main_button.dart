import 'package:amk_mobile/constants/app_color.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final double? width;
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const MainButton({
    super.key,
    this.width,
    required this.title,
    this.textColor,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.mainColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
