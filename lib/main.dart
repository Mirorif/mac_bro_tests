import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user_db.dart';
import 'package:mac_bro_test/routes/app_pages.dart';
import 'package:mac_bro_test/routes/app_routes.dart';
import 'package:mac_bro_test/translations/app_translations.dart';
import 'bindings/splash_bindings.dart';
import 'core/constants/constants.dart';
import 'core/theme/app_theme.dart';
import 'data/hive/hive_database.dart';
import 'data/hive/products.dart';
import 'data/source/local_source.dart';


// flutter pub run flutter_launcher_icons:main
// flutter run -d windows --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety
// flutter build apk --split-per-abi --no-sound-null-safety
// flutter build appbundle --release --no-sound-null-safety
// flutter pub run build_runner watch --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initial db
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(UserAdapter());
  await HiveDatabase.getInstance();
  /// local source
  await LocalSource.getInstance();
  /// user db
  await UserDatabase.getInstance();

  runApp(MyApp(currentLocale: LocalSource.instance.getLocale(),));
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  const MyApp({
    Key? key,
    required this.currentLocale
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: ScreenUtilInit(
        designSize: const Size(375, 812), builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: "Sample",
            debugShowCheckedModeBanner: false,
            navigatorKey: AppConstants.navigatorKey,
            /// theme
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            /// pages
            getPages: AppPages.pages,
            initialRoute: AppRoutes.initial,
            initialBinding: SplashBindings(),
            /// locale
            locale: Locale(currentLocale),
            supportedLocales: const [
              Locale("ru","RU"),
              Locale("uz","UZ"),
              Locale("en","US"),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            /// page transition
            translationsKeys: AppTranslations.translations,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 100),
          );
      },

      ),
    );
  }
}
