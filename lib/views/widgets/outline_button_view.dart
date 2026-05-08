import 'package:flutter/material.dart';

class OutlineButtonView extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const OutlineButtonView({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(title, style: TextStyle(color: Color(0xFFA53C6F), fontSize: 18),)),
      ),
    );
  }
}
