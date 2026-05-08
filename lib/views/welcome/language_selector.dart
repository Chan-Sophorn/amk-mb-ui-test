import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/localization/locale_controller.dart';
import '../../constants/app_images.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({super.key});

  final localeController = Get.find<LocaleController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String selectedLang = localeController.isKhmer.value ? 'KH' : (localeController.locale.value.languageCode == 'en' ? 'EN' : 'CN');

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            _langItem(AppImages.flagEnglish, 'EN', selectedLang),
            _langItem(AppImages.flagChinese, 'CN', selectedLang),
            _langItem(AppImages.flagKhmer, 'KH', selectedLang),
          ],
        ),
      );
    });
  }

  Widget _langItem(String flag, String code, String selectedLang) {
    final isSelected = selectedLang == code;
      // Map code to display label
  final displayLabel = {
    'EN': 'EN',
    'CN': '中文',
    'KH': 'ខ្មែរ',
  }[code] ?? code;

    return GestureDetector(
      onTap: () => localeController.changeLanguage(code),
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(flag, height: 22),
            const SizedBox(width: 4),
            Text(displayLabel),
          ],
        ),
      ),
    );
  }
}
