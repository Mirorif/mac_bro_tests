import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mac_bro_test/core/constants/app_keys.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user.dart'as db;
import 'package:mac_bro_test/data/source/local_source.dart';
import 'package:mac_bro_test/ui/auth/auth_page.dart';
import 'package:mac_bro_test/ui/main/favorite/favorite_page.dart';
import '../../../controller/main/main_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/hive/hive_database.dart';
import '../home/home_page.dart';
import '../orders/orders_page.dart';
import '../profile/profile_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.bgColor,
        body: IndexedStack(
          index: controller.bottomMenu.index,
          children: const [
             HomePage(),
             MyOrdersPage(),
             FavoritePage(),
             ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.unselectedBottomNavItem,
          selectedItemColor: AppColors.blue,
          onTap: (pos) => controller.setMenu(BottomMenu.values[pos]),
          currentIndex: controller.bottomMenu.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          elevation: 8,
          items: [
            _bottomNavigationBarItem(
              icon: 'ic_home',
              label: 'home'.tr,
              activeIcon: 'ic_active_home',
            ),
            _bottomNavigationBarItem(
              icon: 'ic_buy',
              label: 'basket'.tr,
              activeIcon: 'ic_active_buy',
            ),
            _bottomNavigationBarItem(
              icon: 'ic_heart',
              label: 'favourite'.tr,
              activeIcon: 'ic_active_heart',
            ),
            _bottomNavigationBarItem(
              icon: 'ic_profile',
              label: 'profile'.tr,
              activeIcon: 'ic_active_profile',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({
    required String activeIcon,
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$icon.svg'),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$activeIcon.svg'),
      ),
      label: label,
    );
  }
}
