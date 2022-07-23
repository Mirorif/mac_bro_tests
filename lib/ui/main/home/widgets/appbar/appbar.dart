import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/home/home_controller.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_utils.dart';


TextEditingController search = TextEditingController();
AppBar appBar = AppBar(
  elevation: 0,
  title:  Row(
    children: [
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: AppColors.bgColor,
          ),
          height: 44,
          child: GetBuilder<HomeController>(
            builder: (ctr) {
              return TextFormField(
                controller: search,
                onTap: (){
                  ctr.searchProduct(search.text);
                },
                decoration: InputDecoration(
                  hintText: "search".tr,
                  border: InputBorder.none,
                  prefixIcon: Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/png/ic_search.png')),
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SvgPicture.asset("assets/svg/ic_bell.svg"),
      ),
    ],
  ),
);