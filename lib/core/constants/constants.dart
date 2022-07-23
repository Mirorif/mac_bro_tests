import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();
  static const shipperId = !kDebugMode
      ? 'd4b1658f-3271-4973-8591-98a82939a664'
      : 'e2d30f35-3d1e-4363-8113-9c81fdb2a762';
  static const baseUrl = 'https://api.client.macbro.uz/v1/';
  static const authUrl = 'https://api.auth.macbro.uz/v1/';
  static const apiKey = '1d47efd1-f633-41db-a353-234f595d9c1a';
  static const yandexKey = 'https://geocode-maps.yandex.ru/1.x/';
  static const platformId = '7d4a4c38-dd84-4902-b744-0488b80a4c01';
  static const clientTypeId = "5a3818a9-90f0-44e9-a053-3be0ba1e2c07";
  static const roleId = "a1ca1301-4da9-424d-a9e2-578ae6dcde07";
  static const finishedOrders = 'e665273d-5415-4243-a329-aee410e39465';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
