import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mac_bro_test/base/base_functions.dart';
import 'package:mac_bro_test/controller/main/home/home_controller.dart';
import 'package:mac_bro_test/core/constants/app_keys.dart';
import 'package:mac_bro_test/core/constants/constants.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_text_style.dart';
import 'package:mac_bro_test/data/hive/hive_database.dart';
import 'package:mac_bro_test/data/hive/products.dart' as db;
import '../../../../../core/theme/app_utils.dart';
import '../../../../../data/hive/products.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          const SizedBox(height: 32),
          Text(
            "new".tr,
            style: AppTextStyles.basicTitle,
          ),
          //cards
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ctr.featured.isNotEmpty
                  ? ctr.featured.first.products?.length
                  : 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 152,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: AppUtils.kAllPadding8,
                        width: 152,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          color: AppColors.white,
                          // image: DecorationImage(
                          //   image: NetworkImage(
                          //       ctr.featured.first.products?[index].image ??
                          //           'error with img'),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: ctr.featured.first.products?[index].image ?? '',
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const Center(
                                          child: CupertinoActivityIndicator()),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  ctr.checkFavorite(
                                    ctr.featured.first.products?[index].id ??
                                        '',
                                    ctr.featured.first.products?[index].name ??
                                        "error with title",
                                    ctr.featured.first.products?[index].image ??
                                        'error with img',
                                    BaseFunctions.moneyFormat(ctr.featured.first
                                            .products?[index].cheapestPrice ??
                                        0),
                                  );
                                },
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.bgColor,
                                  ),
                                  child: Center(
                                    child: (HiveDatabase.boxFavourite
                                                ?.containsKey(ctr.featured.first
                                                    .products?[index].id) ??
                                            false)
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
                        ctr.featured.first.products?[index].name ??
                            "error with title",
                        style: AppTextStyles.subTitle,
                        maxLines: 1,
                      )),

                      //price
                      const SizedBox(height: 4),
                      Text(
                        "${BaseFunctions.moneyFormat(double.parse(ctr.featured.first.products?[index].cheapestPrice.toString() ?? ''))} ${"sum".tr}",
                        style: AppTextStyles.price,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
