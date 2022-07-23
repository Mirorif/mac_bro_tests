import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/profile/profile_controller.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user_db.dart';
import 'package:mac_bro_test/data/source/local_source.dart';
import 'package:mac_bro_test/main.dart';
import 'package:mac_bro_test/routes/app_routes.dart';
import 'package:mac_bro_test/ui/main/home/home_page.dart';
import 'package:mac_bro_test/ui/main/main/main_page.dart';

import '../../../../core/theme/app_text_style.dart';

class SettingsPage extends GetView<ProfileController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showForm(BuildContext ctx) async {
      showModalBottomSheet(
          context: ctx,
          isScrollControlled: true,
          builder: (_) => Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 8,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 30,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffcfcfcf),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        LocalSource.instance.setLocale("ru");
                        Navigator.of(context).pop();
                        Get.updateLocale(const Locale('ru'));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/svg/ic_russia.svg'),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Russia"),
                                  LocalSource.instance.getLocale() == "ru"
                                      ? const Icon(
                                          Icons.check,
                                          color: AppColors.blue,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        LocalSource.instance.setLocale('uz');
                        Navigator.of(context).pop();
                        Get.updateLocale(const Locale('uz'));
                      },
                      child: SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/ic_uzbekistan.svg'),
                            const SizedBox(width: 16),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Uzbek"),
                                LocalSource.instance.getLocale() == "uz"
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColors.blue,
                                      )
                                    : Container(),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ));
    }

    return GetBuilder<ProfileController>(builder: (ctr) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'settings'.tr,
            style: AppTextStyles.sampleAppBar,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  bool result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          shape: const OutlineInputBorder(
                              borderRadius: AppUtils.kBorderRadius16),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('attention'.tr, textAlign: TextAlign.center),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0),
                                child: Text(
                                  'log_out_text'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.black1,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.of(context,
                                            rootNavigator: true)
                                        .pop(false),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: AppColors.black16,
                                      primary: AppColors.white,
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1,
                                            color: AppColors.darkGrey,
                                            style: BorderStyle.solid),
                                        borderRadius: AppUtils.kBorderRadius8,
                                      ),
                                    ).copyWith(
                                      elevation: MaterialStateProperty
                                          .resolveWith<double>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.pressed)) return 0;
                                          return 0;
                                        },
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 5),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'cancel'.tr,
                                        style: const TextStyle(
                                          color: AppColors.black1,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      UserDatabase.instance.deleteUser();
                                      Get.offAllNamed(
                                        AppRoutes.main,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: AppColors.white,
                                      primary: AppColors.blue,
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1,
                                            color: AppColors.blue,
                                            style: BorderStyle.solid),
                                        borderRadius: AppUtils.kBorderRadius8,
                                      ),
                                    ).copyWith(
                                      elevation: MaterialStateProperty
                                          .resolveWith<double>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.pressed)) return 0;
                                          return 0;
                                        },
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 40),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'yes'.tr,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                          //   Text('attention'.tr, textAlign: TextAlign.center),

                          //Text('log_out_text'.tr, textAlign: TextAlign.center, style: AppTextStyles.appTitleSearch,),
                          // actions: <Widget>[
                          //   Padding(
                          //     padding: const EdgeInsets.only(bottom: 24),
                          //     child: ElevatedButton(
                          //       onPressed: ()=>Navigator.of(context, rootNavigator: true).pop(false),
                          //       style: ElevatedButton.styleFrom(
                          //         onPrimary: AppColors.darkGrey,
                          //         primary: AppColors.white,
                          //         shape: const RoundedRectangleBorder(
                          //           side: BorderSide(
                          //             width: 1,
                          //             color: AppColors.blue,
                          //             style: BorderStyle.solid
                          //           ),
                          //           borderRadius: AppUtils.kBorderRadius8,
                          //         ),
                          //       ).copyWith(
                          //         elevation: MaterialStateProperty.resolveWith<double>(
                          //               (Set<MaterialState> states) {
                          //             if (states.contains(MaterialState.pressed)) return 0;
                          //             return 0;
                          //           },
                          //         ),
                          //       ),
                          //       child: Container(
                          //         width: 120,
                          //         height: 36,
                          //         padding: AppUtils.kAllPadding8,
                          //         alignment: Alignment.center,
                          //         child: const Text('No'),
                          //       ),
                          //     ),
                          //   ),
                          //   Padding(
                          //     padding: const EdgeInsets.only(bottom: 16),
                          //     child: ElevatedButton(
                          //       onPressed: ()=>Navigator.of(context, rootNavigator: true).pop(false),
                          //       style: ElevatedButton.styleFrom(
                          //         onPrimary: AppColors.darkGrey,
                          //         primary: AppColors.white,
                          //         shape: const RoundedRectangleBorder(
                          //           side: BorderSide(
                          //               width: 1,
                          //               color: AppColors.blue,
                          //               style: BorderStyle.solid
                          //           ),
                          //           borderRadius: AppUtils.kBorderRadius8,
                          //         ),
                          //       ).copyWith(
                          //         elevation: MaterialStateProperty.resolveWith<double>(
                          //               (Set<MaterialState> states) {
                          //             if (states.contains(MaterialState.pressed)) return 0;
                          //             return 0;
                          //           },
                          //         ),
                          //       ),
                          //       child: Container(
                          //         width: 120,
                          //         height: 36,
                          //         padding: AppUtils.kAllPadding8,
                          //         alignment: Alignment.center,
                          //         child: const Text('Yes'),
                          //       ),
                          //     ),
                          //   ),
                          // ],
                          );
                    },
                  );

                  //   () {
                  // UserDatabase.instance.deleteUser();
                  // Get.offNamed(
                  //   AppRoutes.main,
                  // );
                },
              ),
            ),
          ],
        ),
        body: Container(
          color: AppColors.bgColor,
          padding: AppUtils.kAllPadding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius16,
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _showForm(context);
                      },
                      child: Container(
                        padding: AppUtils.kAllPadding16,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/ic_globe.svg',
                              color: AppColors.blue,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'language'.tr,
                                        style: AppTextStyles.appBarTitle,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(LocalSource
                                                    .instance
                                                    .getLocale() ==
                                                "ru"
                                            ? 'assets/svg/ic_russia.svg'
                                            : 'assets/svg/ic_uzbekistan.svg'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: AppUtils.kAllPadding16,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/ic_trash.svg',
                            color: AppColors.blue,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'clear_cache'.tr,
                                      style: AppTextStyles.appBarTitle,
                                    ),
                                    const Icon(
                                        Icons.keyboard_arrow_right_outlined),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: AppUtils.kAllPadding16,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/ic_bell.svg',
                            color: AppColors.blue,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'alerts'.tr,
                                      style: AppTextStyles.appBarTitle,
                                    ),
                                    CupertinoSwitch(
                                        value: false,
                                        activeColor: AppColors.blue,
                                        onChanged: (value) {})
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: AppUtils.kAllPadding16,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/ic_volume.svg',
                            color: AppColors.blue,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'sound'.tr,
                                      style: AppTextStyles.appBarTitle,
                                    ),
                                    CupertinoSwitch(
                                        value: true,
                                        activeColor: AppColors.blue,
                                        onChanged: (value) {})
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${"version".tr} 1.0.1",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
