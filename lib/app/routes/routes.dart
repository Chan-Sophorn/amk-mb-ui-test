import 'package:amk_mobile/views/home/amk_home_view.dart';
import 'package:amk_mobile/views/home/notification/notification_view.dart';
import 'package:amk_mobile/views/splash_screen_view.dart';
import 'package:amk_mobile/views/welcome_screen_view.dart';
import 'package:get/route_manager.dart';
import '../../views/home/amk_main_home_view.dart';

class Routes {
  static const SPLASH_SCREEN = '/';
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const MAIN_HOME_SCREEN = '/main';
  static const SIGN_IN = '/signIn';
  static const OTP_SCREEN = '/otpScreen';
  static const NOTIFICATION_SCREEN = '/notification';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH_SCREEN, page: () => SplashScreenView()),
    GetPage(name: Routes.WELCOME, page: () => WelcomeScreenView()),
    GetPage(name: Routes.MAIN_HOME_SCREEN, page: () => AmkMainHomeView()),
    GetPage(name: Routes.HOME, page: () => AmkHomeView()),
    GetPage(name: Routes.NOTIFICATION_SCREEN, page: () => NotificationView()),
  ];
}
