import 'package:amk_mobile/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const MainBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'home'.tr,
            isSelected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          _NavItem(
            icon: Icons.credit_card_outlined,
            label: 'cards'.tr,
            isSelected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          _QrItem(onTap: () => onItemSelected(2)),
          _NavItem(
            icon: Icons.chat_bubble_outline,
            label: 'chat'.tr,
            isSelected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
          ),
          _NavItem(
            icon: Icons.grid_view_outlined,
            label: 'others'.tr,
            isSelected: selectedIndex == 4,
            onTap: () => onItemSelected(4),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColor.mainColor : Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QrItem extends StatelessWidget {
  final VoidCallback onTap;

  const _QrItem({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(Icons.qr_code_2, color: Colors.white, size: 36),
      ),
    );
  }
}
