
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:mac_bro_test/core/constants/app_keys.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user.dart' as db;
import 'package:mac_bro_test/routes/app_routes.dart';

import '../../base/base_controller.dart';

class MainController extends BaseController {
  BottomMenu _bottomMenu = BottomMenu.home;

  void setMenu(BottomMenu menu) {
    if(menu.index == 3) {
       if(Hive.box<db.Users>(AppKeys.userDb).containsKey(AppKeys.profile)) {
         _bottomMenu = menu;
       } else {
         Get.toNamed(AppRoutes.auth);
       }
    } else {
      _bottomMenu = menu;
    }

    // _bottomMenu = menu;
    update();
  }

  BottomMenu get bottomMenu => _bottomMenu;
}

enum BottomMenu { home, myOrders, favorite, profile }
