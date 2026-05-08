import 'package:amk_mobile/constants/app_color.dart';
import 'package:amk_mobile/constants/app_images.dart';
import 'package:amk_mobile/models/country.dart';
import 'package:amk_mobile/services/controller/country_controller.dart';
import 'package:amk_mobile/services/controller/sign_in_controller.dart';
import 'package:amk_mobile/views/welcome/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInView extends StatelessWidget {
  final String headerTitle;
  final String centerTitle;
  final String icon;

  SignInView({
    super.key,
    required this.headerTitle,
    required this.centerTitle,
    required this.icon,
  });

  final countryController = Get.put(CountryController());
  final signInController = Get.put(SignInController());

  final countries = [
    Country(name: "Cambodia", flag: AppImages.flagKhmer, dialCode: "+855"),
    Country(name: "English", flag: AppImages.flagEnglish, dialCode: "+1"),
    Country(name: "Chinese", flag: AppImages.flagChinese, dialCode: "+86"),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                SvgPicture.asset(icon, height: 45),
              ],
            ),
          ),
          Text(
            centerTitle,
            style: const TextStyle(
              color: AppColor.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Phone number label
                          Text(
                            'phone_number'.tr,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Country code + phone input
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.22,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.editTextBoarderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: SelectCountryView(
                                    countries: countries,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: signInController.phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: 'input_phone_number'.tr,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    labelStyle: const TextStyle(
                                      color: Colors.grey
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: AppColor.editTextBoarderColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: AppColor.mainColor,
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Description text
                          Text(
                            'phone_description'.tr,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // PIN field
                          TextField(
                            controller: signInController.pinController,
                            obscureText: true,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'pin_6_digit'.tr,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColor.mainColor,
                              ),
                              floatingLabelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              counterText: '',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColor.editTextBoarderColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColor.mainColor,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Forgot PIN
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // TODO: navigate to forgot PIN screen
                              },
                              child: Text(
                                'forgot_pin'.tr,
                                style: const TextStyle(
                                  color: AppColor.mainColor,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Continue button — always pinned at the bottom
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 15),
                      child: PrimaryButton(
                        title: 'continue_btn'.tr,
                        color: AppColor.mainColor,
                        onTap: signInController.continueSignIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectCountryView extends StatelessWidget {
  SelectCountryView({super.key, required this.countries});

  final List<Country> countries;
  final CountryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            controller.selectedDialCode.value,
            style: const TextStyle(fontSize: 13),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 18),
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final item = countries[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(item.flag),
                          ),
                          title: Text(item.name),
                          // trailing: Text(item.dialCode),
                          onTap: () {
                            controller.selectCountry(item.name, item.dialCode);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
