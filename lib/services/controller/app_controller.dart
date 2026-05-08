import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  var version = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadVersion();
  }

  void loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    version.value = "${info.version}+${info.buildNumber}";
  }
}