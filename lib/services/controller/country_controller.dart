import 'package:get/get.dart';

class CountryController extends GetxController {
  var selectedCountry = "".obs;
  var selectedDialCode = "+855".obs;

  void selectCountry(String name, String dialCode) {
    selectedCountry.value = name;
    selectedDialCode.value = dialCode;
  }
}