import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mac_bro_test/controller/main/favorite/favorite_controller.dart';
import 'package:mac_bro_test/core/constants/app_keys.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/empty_page/empty_page.dart';
import 'package:mac_bro_test/data/hive/hive_database.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/app_utils.dart';
import '../../../data/hive/products.dart' as db;
import '../../../data/hive/products.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
            appBar: SampleAppBar(
              title: "favourite".tr,
            ),
            body: Container(
              padding: AppUtils.kAllPadding16,
              child: ValueListenableBuilder<Box<db.Products>>(
                valueListenable: Hive.box<db.Products>(AppKeys.db).listenable(),
                builder: (_, box, __) {
                  Map<dynamic, dynamic> raw = box.toMap();
                  List list = raw.values.toList();
                  return box.isNotEmpty
                      ? GridView.builder(
                    physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.25),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            Products products = list[index];

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: AppUtils.kAllPadding8,
                                  height: 160,
                                  decoration: const BoxDecoration(
                                    borderRadius: AppUtils.kBorderRadius8,
                                    color: AppColors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: Image.network(products.image ??
                                              'error with img')),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                              onTap: () {
                                                HiveDatabase.instance
                                                    .deleteProduct(products.id);
                                               // Hive.box<db.Products>(AppKeys.db).isNotEmpty ? ctr.activeBool(true) : ctr.activeBool(false);
                                              },
                                              child: Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: AppColors.bgColor,
                                                ),
                                                child: Center(
                                                  child: Hive.box<db.Products>(
                                                              AppKeys.db)
                                                          .containsKey(products.id)
                                                      ? SvgPicture.asset(
                                                          'assets/svg/ic_active_like.svg')
                                                      : SvgPicture.asset(
                                                          'assets/svg/ic_like.svg'),
                                                ),
                                              ),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                //subtitle
                                const SizedBox(height: 8),
                                Expanded(
                                    child: Text(
                                  products.name ?? "error with title",
                                  style: AppTextStyles.subTitle,
                                  maxLines: 1,
                                )),

                                //price
                                const SizedBox(height: 4),
                                Text(
                                  "${products.price} ${"sum".tr} ",
                                  style: AppTextStyles.price,
                                ),
                              ],
                            );
                          },
                        )
                      : const EmptyPage();
                },
              ),
            ),
      );
  }
}
