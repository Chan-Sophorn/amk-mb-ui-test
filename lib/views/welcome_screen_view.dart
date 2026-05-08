import 'package:amk_mobile/constants/app_images.dart';
import 'package:amk_mobile/services/controller/app_controller.dart';
import 'package:amk_mobile/views/welcome/bottom_menu.dart';
import 'package:amk_mobile/views/welcome/header_view.dart';
import 'package:amk_mobile/views/welcome/main_card.dart';
import 'package:amk_mobile/views/widgets/background_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenView extends StatelessWidget {
WelcomeScreenView({super.key});
final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundView(assetPath: AppImages.bgWelcome),
          SafeArea(
            child: Column(
              children: [
                HeaderView(),
                Spacer(),
                MainCard(),
                SizedBox(height: 6),
                _BottomBar(),
                SizedBox(height: 10),
                Obx(() => Text("Version: ${controller.version.value}")),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
      ),
      child: const BottomMenu(),
    );
  }
}

