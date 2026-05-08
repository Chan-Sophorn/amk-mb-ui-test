import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFFA53C6F),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
