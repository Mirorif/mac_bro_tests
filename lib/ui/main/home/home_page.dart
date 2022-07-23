import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/home/home_controller.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';
import 'package:mac_bro_test/ui/main/home/widgets/banner/banner_widget.dart';
import 'package:mac_bro_test/ui/main/home/widgets/category/category_widget.dart';
import 'package:mac_bro_test/ui/main/home/widgets/new/new_widget.dart';
import 'package:mac_bro_test/ui/main/home/widgets/search_item/search_item.dart';
import 'package:mac_bro_test/ui/shimmer/shimmer_ui.dart';
import '../../../core/custom_widgets/flappy_searchbar/flappy_search_bar.dart';
import '../../../core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../data/models/products/product_response.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SearchBar<Product>(
          onError: (error) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svg/ic_empty.svg'),
                Text('not_found'.tr, style: AppTextStyles.searchNotFound)
              ],
            ),
          ),
          hintText: 'search'.tr,
          hintStyle: AppTextStyles.searchItem.copyWith(
            color: AppColors.baseText50,
          ),
          textStyle: AppTextStyles.searchItem,
          searchBarPadding: AppUtils.kAllPadding16,
          cancellationWidget: Text(
            'cancel'.tr,
            maxLines: 1,
            style: AppTextStyles.searchItem,
            textAlign: TextAlign.center,
          ),
          icon: Padding(
            padding: AppUtils.kLeftPadding8,
            child: SvgPicture.asset('assets/svg/ic_search.svg'),
          ),
          placeHolder: GetBuilder<HomeController>(
            builder: (ctr) {
              return ctr.isLoading ? _shimmer(const ShimmerUiPage()) : Material(
                color: AppColors.bgColor,
                child: Padding(
                  padding: AppUtils.kAllPadding16,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: const [
                         BannerWidget(),
                         NewWidget(),
                         CategoryWidget(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          onItemFound: (product, index) => SearchItem(
            product: product,
            onTap: () async {
              // Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
            },
          ),
          onSearch: controller.searchProduct,
          listPadding: AppUtils.kAllPadding8,
          loader: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _shimmer(child) {
    return Shimmer.fromColors(
      child: child,
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
    );
  }
}
