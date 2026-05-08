import 'package:amk_mobile/constants/app_color.dart';
import 'package:amk_mobile/constants/app_images.dart';
import 'package:amk_mobile/views/welcome/login/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmOtpView extends StatelessWidget {
  final String phoneNumber;
  const ConfirmOtpView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.mainColor),
          onPressed: () => Get.back(),
        ),
        title: Text("login".tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppImages.circleRadius),
                Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
          Text(
            "Confirm Otp",
            style: const TextStyle(
              color: AppColor.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "សូមបញ្ចូលលេខកូដបញ្ជាក់ ៦ខ្ទង់ ​ដែល​បាន​ផ្ញើទៅកាន់លោកអ្នក តាមរយៈលេខទូរស័ព្ទ $phoneNumber",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    OtpView(),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PinCodeTextField ConfirmOtp(BuildContext context) {
    return PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    onChanged: (value) {},
                     onCompleted: (value) {
                      print("OTP: $value");
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 55,
                      fieldWidth: 45,
                      activeColor: Colors.grey,
                      selectedColor: Colors.grey.shade300,
                      inactiveColor: Colors.grey.shade300,
                      inactiveFillColor: Colors.grey.shade300,
                      activeFillColor: Colors.grey.shade300,
                      selectedFillColor: Colors.grey.shade300,
                    ),
                    enableActiveFill: true,
                    obscureText: false,
                  );
  }
}
