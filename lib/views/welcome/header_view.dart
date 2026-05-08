import 'package:amk_mobile/constants/app_images.dart';
import 'package:amk_mobile/views/welcome/language_selector.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppImages.logo, height: 50),
          LanguageSelector(),
        ],
      ),
    );
  }
}
