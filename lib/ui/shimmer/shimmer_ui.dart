import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';

class ShimmerUiPage extends StatelessWidget {
  const ShimmerUiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kAllPadding16,
      child: ListView(
        children: [
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: AppColors.bgColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              const SizedBox(height: 32),
              Container(
                height: 20,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: AppColors.green,
                ),
              ),
              //cards
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
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
                            decoration: const BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius8,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 20,
                            width: 120,
                            decoration: const BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius8,
                              color: AppColors.green,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 20,
                            width: 140,
                            decoration: const BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius8,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              const SizedBox(height: 32),
              Container(
                height: 20,
                width: 80,
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: AppColors.green,
                ),
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
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 166,
                    padding: AppUtils.kAllPadding16,
                    decoration: const BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius8,
                      color: AppColors.white,
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
