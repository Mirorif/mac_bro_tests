import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/custom_button/custom_button.dart';
import 'package:mac_bro_test/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:mac_bro_test/data/source/local_source.dart';
import '../../../../../../controller/main/home/home_controller.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/theme/app_utils.dart';
import 'all_products.dart';

class CategoryDetailCPageChildren extends GetView<HomeController> {
  final String id;
  final String title;
  const CategoryDetailCPageChildren({Key? key, required this.title, required this.id})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SampleAppBar(title: title,),
      body: GetBuilder<HomeController>(
        builder: (ctr) {
          return ModalProgressHUD(
            inAsyncCall: ctr.isLoading,
            child: Container(
              padding: AppUtils.kAllPadding16,
              child: SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomButton(
                      borderRadius: AppUtils.kBorderRadius8,
                      padding: AppUtils.kAllPadding16,
                      color: AppColors.white,
                      onTap: (){
                        ctr.getProductVariant(id, LocalSource.instance.getLocale());
                        Get.to( ()=> AllProducts(title: title));
                      },
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/svg/ic_hamburger_menu.svg"),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("all_products".tr, style: AppTextStyles.customButtonTitle,),
                              SvgPicture.asset("assets/svg/ic_arrow_left.svg"),
                            ],
                          ),
                        )
                      ],
                    ),),
                    const SizedBox(height: 16,),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      itemCount: ctr.product.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              height: 190,
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                borderRadius: AppUtils.kBorderRadius8,
                                color: AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    height: 95,
                                    imageUrl: ctr.product[index].image ?? '',
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                    const Center(
                                        child: CupertinoActivityIndicator()),
                                  ),
                                  // Container(
                                  //   height: 95,
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: NetworkImage(
                                  //           ctr.product[index].image ?? 'https://storage2.alifshop.uz/files?k1=589bd271-5c4a-4db6-b54e-07af007dc9a9&k2=8cd57ba06d4736880382f8383ee3094b205895b30a31a9bddac5e3b1d6f880f7632c81d307d3fbb5060d5d2a8928adf5ba632bccd36154bd68e73498b55d8a5d'),
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Text(
                                      "${ctr.product[index].name}",
                                      style: AppTextStyles.subTitle,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Expanded(child: Text(
                                    "${ctr.product[index].cheapestPrice} ${"sum".tr}",
                                    style: AppTextStyles.price,
                                    maxLines: 1,
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
