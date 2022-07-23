import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../base/base_functions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/theme/app_utils.dart';
import '../../../../../data/models/products/product_response.dart';

class SearchItem extends StatelessWidget {
  final Product? product;
  final Function()? onTap;

  const SearchItem({Key? key, this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius12,
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                leading: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 0.05),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product?.image ?? '',
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/png/logo.png"),
                  ),
                ),
                title: Text(
                  product?.name ?? "",
                  style: AppTextStyles.searchItemTitle,
                ),
                // trailing: SvgPicture.asset('assets/svg/ic_cancel.svg')
            ),
            Container(height: 1, width: double.infinity, margin: const EdgeInsets.only(left: 75), color: const Color.fromRGBO(0, 0, 0, 0.05),),
          ],
        ),
      ),
    );
  }
}
