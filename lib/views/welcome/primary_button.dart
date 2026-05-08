import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor = Colors.white;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.color,
    textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
