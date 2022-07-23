import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/home/home_controller.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:mac_bro_test/data/models/category/categories_response.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/theme/app_utils.dart';
import 'category_detail_page_children.dart';

class CategoryDetailPage extends GetView<HomeController> {
  final String title;
  final List<Children> children;

  const CategoryDetailPage(
      {Key? key, required this.children, required this.title})
      : super(key: key);

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
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1 / 1,
                  crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: children.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: AppUtils.kBorderRadius8,
                  onTap: () {
                    Get.to(
                      () => CategoryDetailCPageChildren(
                        title: children[index].name.toString(),
                        id: children[index].id.toString(),
                      ),
                    );
                    ctr.getProductByBrand(children[index].id.toString());
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
                          height: 90,
                          image: NetworkImage(
                              children[index].image ?? 'https://storage2.alifshop.uz/files?k1=589bd271-5c4a-4db6-b54e-07af007dc9a9&k2=8cd57ba06d4736880382f8383ee3094b205895b30a31a9bddac5e3b1d6f880f7632c81d307d3fbb5060d5d2a8928adf5ba632bccd36154bd68e73498b55d8a5d'),
                        ),
                         Text(
                          "${children[index].name}",
                          style: AppTextStyles.subTitle,
                           maxLines: 1,
                           textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
