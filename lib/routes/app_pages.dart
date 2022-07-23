import 'package:get/get.dart';
import 'package:mac_bro_test/bindings/auth_bindings.dart';
import 'package:mac_bro_test/ui/auth/auth_page.dart';
import 'package:mac_bro_test/ui/auth/phone_number_take.dart';
import 'package:mac_bro_test/ui/auth/registration_page.dart';

import '../bindings/main_bindings.dart';
import '../bindings/splash_bindings.dart';
import '../ui/internet_connection/internet_connection_page.dart';
import '../ui/main/main/main_page.dart';
import '../ui/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: AppRoutes.internetConnection,
      page: () => const InternetConnectionPage(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.phoneNumberCheck,
      page: () => PhoneNumberTakePage(),
    ),
    GetPage(
      name: AppRoutes.registration,
      page: () => RegistrationPage(),
    ),
  ];
}
