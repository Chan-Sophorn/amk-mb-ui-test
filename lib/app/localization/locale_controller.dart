import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  final locale = const Locale('km', 'KH').obs;
  final isKhmer = true.obs;

  void setLocaleOnStartup(String code) {
    changeLanguage(code, save: false);
  }

  void changeLanguage(String code, {bool save = true}) {
    Locale newLocale;

    switch (code) {
      case 'KH':
        newLocale = const Locale('km', 'KH');
        isKhmer.value = true;
        break;

      case 'CN':
        newLocale = const Locale('zh', 'CN');
        isKhmer.value = false;
        break;

      default:
        newLocale = const Locale('en', 'US');
        isKhmer.value = false;
    }

    locale.value = newLocale;

    /// Important for GetX translations
    Get.updateLocale(newLocale);

    if (save) {
      GetStorage().write('language', code);
    }
  }
}