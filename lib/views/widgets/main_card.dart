import 'package:amk_mobile/app/routes/routes.dart';
import 'package:amk_mobile/constants/app_color.dart';
import 'package:amk_mobile/constants/app_images.dart';
import 'package:amk_mobile/views/welcome/login/sign_in_view.dart';
import 'package:amk_mobile/views/widgets/outline_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../welcome/main_button.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.only(top: 26, bottom: 26, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withValues(alpha: 0.1)),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {
                  Get.toNamed(Routes.MAIN_HOME_SCREEN);
                },
                child: const Text(
                  'Home Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          MainButton(
            title: "login".tr,
            textColor: Colors.white,
            onTap: () {
              // Get.toNamed(Routes.SIGN_IN);
              Get.to(
                () => SignInView(
                  headerTitle: "login".tr,
                  centerTitle: "input_phone_number".tr,
                  icon: AppImages.icPhone,
                ),
              );
            },
          ),
          const SizedBox(height: 14),
          OutlineButtonView(title: "signup".tr, onTap: () {}),
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "no_have_amk_account".tr,
                  style: TextStyle(backgroundColor: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          MainButton(
            title: "selfie_banking".tr,
            backgroundColor: Colors.grey.shade200,
            textColor: AppColor.mainColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
