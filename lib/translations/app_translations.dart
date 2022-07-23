import 'package:get/get.dart';

import 'ru.dart';
import 'uz.dart';
import 'en.dart';

abstract class AppTranslations {
  static Map<String, Map<String, String>> translations = {
    'en': en,
    'ru': ru,
    'uz': uz,
  };}