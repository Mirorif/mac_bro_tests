import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mac_bro_test/controller/main/profile/profile_controller.dart';
import 'package:mac_bro_test/core/constants/app_keys.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_text_style.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';
import 'package:mac_bro_test/ui/main/profile/profile/profile_options.dart';
import 'package:mac_bro_test/ui/main/profile/profile/settings.dart';

import '../../../data/models/auth/user_db/user.dart' as db;

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (ctr) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: Visibility(
          visible: Hive.box<db.Users>(AppKeys.userDb).containsKey(AppKeys.profile),
          child: SafeArea(
            child: Container(
              color: AppColors.bgColor,
              child: ListView(
                children: [
                  ValueListenableBuilder<Box<db.Users>>(
                  valueListenable: Hive.box<db.Users>(AppKeys.userDb).listenable(),
                    builder: (_,box, __) {
                      Map<dynamic, dynamic> raw = box.toMap();
                      List list = raw.values.toList();
                      return Material(
                        elevation: 1,
                        child: Container(
                          color: AppColors.white,
                          height: 128,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                 list[0].surname,
                                style: AppTextStyles.profileTitle,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                list[0].name,
                                style: AppTextStyles.profileTitle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                list[0].phone,
                                style: AppTextStyles.profileNumberTitle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: AppUtils.kAllPadding16,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius16,
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          ProfileOptions(image: 'ic_profile', title: 'change_profile'.tr),
                          Container(
                            margin: const EdgeInsets.only(left: 52),
                            width: double.infinity,
                            height: 1,
                            color: const Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          ProfileOptions(image: 'ic_notebook', title: 'history_orders'.tr),
                          Container(
                            margin: const EdgeInsets.only(left: 52),
                            width: double.infinity,
                            height: 1,
                            color:const Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          ProfileOptions(image: 'ic_time_past', title: 'installment_history'.tr),
                          Container(
                            margin: const EdgeInsets.only(left: 52),
                            width: double.infinity,
                            height: 1,
                            color: const Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          ProfileOptions(image: 'ic_calculator', title: 'installment_calculator'.tr),
                          Container(
                            margin: const EdgeInsets.only(left: 52),
                            width: double.infinity,
                            height: 1,
                            color: const Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          ProfileOptions(image: 'ic_shopping_cart', title: 'shops'.tr),
                          Container(
                            margin: const EdgeInsets.only(left: 52),
                            width: double.infinity,
                            height: 1,
                            color: const Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          ProfileOptions(image: 'ic_settings', title: 'settings'.tr, onTap: (){Get.to(()=> const SettingsPage());},),
                          Container(
                            margin: const EdgeInsets.only(left: 52),
                            width: double.infinity,
                            height: 1,
                            color:const Color.fromRGBO(0, 0, 0, 0.05),
                          ),
                          ProfileOptions(image: 'ic_phone', title: 'contacts'.tr),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}