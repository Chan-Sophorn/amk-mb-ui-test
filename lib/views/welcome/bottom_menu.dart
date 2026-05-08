import 'package:amk_mobile/views/welcome/bottom_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomMenuItem(icon: Icons.location_on, label: "find_branch".tr),
            const SizedBox(width: 10),
            BottomMenuItem(icon: Icons.chat_bubble, label: "help".tr),
            const SizedBox(width: 10),
            BottomMenuItem(icon: Icons.phone, label: "contact".tr),
            const SizedBox(width: 10),
            BottomMenuItem(icon: Icons.contact_mail, label: "about".tr),
          ],
        ),
      ),
    );
  }
}
