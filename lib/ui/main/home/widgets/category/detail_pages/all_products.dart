import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mac_bro_test/data/hive/products.dart' as db;
import '../../../../../../controller/main/home/home_controller.dart';
import '../../../../../../core/constants/app_keys.dart';
import '../../../../../../core/custom_widgets/appbars/sample_app_bar.dart';
import '../../../../../../core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/theme/app_utils.dart';

class AllProducts extends GetView<HomeController> {
  final String title;

  const AllProducts({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      return Scaffold(
        appBar: SampleAppBar(
          title: title,
        ),
        body: ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          child: Container(
            padding: AppUtils.kAllPadding16,
            child: GridView.builder(
              physics:const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.25,
              ),
              shrinkWrap: true,
              itemCount: ctr.productVariant.length,
              itemBuilder: (BuildContext context, int index) {
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
                            child:  CachedNetworkImage(
                              imageUrl: ctr.productVariant[index].image ?? '',
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                              const Center(
                                  child: CupertinoActivityIndicator()),
                            ),
                            // Image.network(
                            //   ctr.productVariant[index].image ?? '',
                            //   height: 95,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                ctr.checkFavorite(
                                  ctr.productVariant[index].id ?? '',
                                  ctr.productVariant[index].name ??
                                      "error with title",
                                  ctr.productVariant[index].image ??
                                      'error with img',
                                  ctr.productVariant[index].price!.uzsPrice
                                      .toString(),
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
                                  child: Hive.box<db.Products>(AppKeys.db)
                                          .containsKey(
                                              ctr.productVariant[index].id)
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
                      ctr.productVariant[index].name ?? "error with title",
                      style: AppTextStyles.subTitle,
                      maxLines: 1,
                    )),
                    //price
                    const SizedBox(height: 4),
                    Text(
                      "${ctr.productVariant[index].price!.uzsPrice} ${"sum".tr}",
                      style: AppTextStyles.price,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
