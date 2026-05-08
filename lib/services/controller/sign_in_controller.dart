import 'package:amk_mobile/views/welcome/login/confirm_otp_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final phoneController = TextEditingController();
  final pinController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    pinController.dispose();
    super.onClose();
  }

  void continueSignIn() {
    if (phoneController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your phone number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        margin: const EdgeInsets.all(12),
      );
      return;
    }
    if (pinController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Please enter your 6-digit PIN',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        margin: const EdgeInsets.all(12),
      );
      return;
    }
    Get.to(ConfirmOtpView(phoneNumber: phoneController.text.trim()));
  }
}
