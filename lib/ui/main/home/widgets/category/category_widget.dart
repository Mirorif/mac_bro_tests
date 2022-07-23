import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/home/home_controller.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_text_style.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';

import 'detail_pages/category_detail_page.dart';
import 'detail_pages/category_detail_page_children.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

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
            "categories".tr,
            style: AppTextStyles.basicTitle,
          ),
          //categories
          const SizedBox(height: 16),

          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1 / 1,
                crossAxisCount: 2),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ctr.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                borderRadius: AppUtils.kBorderRadius8,
                onTap: () {
                  if (ctr.categories[index].children != null) {
                    Get.to(
                      () => CategoryDetailPage(
                        children: ctr.categories[index].children ?? [],
                        title: ctr.categories[index].name.toString(),
                      ),
                    );
                  } else {
                    Get.to(
                      () => CategoryDetailCPageChildren(
                        title: ctr.categories[index].name.toString(),
                        id: ctr.categories[index].id.toString(),
                      ),
                    );
                    ctr.getProductByBrand(ctr.categories[index].id.toString());
                  }
                },
                child: Ink(
                  height: 166,
                  padding: AppUtils.kAllPadding16,
                  decoration: const BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius8,
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Ink.image(
                        image: NetworkImage(
                          ctr.categories[index].image ?? 'error with image',
                        ),
                        height: 95,
                      ),
                      Text(
                        ctr.categories[index].name ?? '',
                        style: AppTextStyles.subTitle,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      );
    });
  }
}
