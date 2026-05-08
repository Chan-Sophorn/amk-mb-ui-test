import 'package:amk_mobile/app/routes/routes.dart';
import 'package:amk_mobile/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    _goToWelcome();
  }

   void _goToWelcome() async {
    await Future.delayed(const Duration(seconds: 3));

    // Replace splash (cannot go back)
    Get.offAllNamed(Routes.WELCOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(AppImages.splashBg, fit: BoxFit.cover,),
          )
        ],
      )
      
    );
  }
}