import 'package:amk_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/localization/app_translation.dart';
import 'app/localization/locale_controller.dart';
import 'app/theme/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // 🔹 Load saved language BEFORE runApp
  final localeController = Get.put(LocaleController(), permanent: true);
  final savedLang = GetStorage().read('language') ?? 'KH';
  localeController.setLocaleOnStartup(savedLang);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH_SCREEN,
          getPages: AppPages.pages,
          title: 'Amk Mobile',

          translations: AppTranslation(),
          locale: localeController.locale.value,
          fallbackLocale: const Locale('en', 'US'),

          theme: localeController.isKhmer.value
              ? AppTheme.khmerTheme
              : AppTheme.englishTheme,
        ));
  }
}