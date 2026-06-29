import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'good_morning'.tr;
    } else if (hour < 18) {
      return 'good_afternoon'.tr;
    } else {
      return 'good_evening'.tr;
    }
  }

  static String formatDateTime(String dateTime) {
  final date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);

  // Current app locale from GetX
  final locale = Get.locale?.toString() ?? 'en_US';

  // Format date in current locale
  final dateStr = DateFormat(
    'dd MMMM yyyy hh:mm:ss',
    locale,
  ).format(date);

  // AM/PM always in English
  final amPm = DateFormat('a', 'en_US').format(date);

  return '$dateStr $amPm';
}


}
