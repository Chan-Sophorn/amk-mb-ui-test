import 'package:flutter/material.dart';

class BottomMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomMenuItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: const Color.fromARGB(185, 184, 25, 83)),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
