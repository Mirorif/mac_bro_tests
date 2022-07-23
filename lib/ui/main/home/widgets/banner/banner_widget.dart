import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/home/home_controller.dart';
import 'package:mac_bro_test/core/theme/app_text_style.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_utils.dart';


class BannerWidget extends StatelessWidget{
  const BannerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final CarouselController controller = CarouselController();


    return GetBuilder<HomeController>(
      builder: (ctr) {
        return Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: AppColors.bgColor,
          ),
          child: Stack(
            children: [
              CarouselSlider(
                items: ctr.banners
                    .map((item) => Stack(
                  children:[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                      decoration: BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius8,
                        image: DecorationImage(
                          image: NetworkImage(item.image ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text(parse(item.description).querySelectorAll("span p strong")[0].innerHtml, style: AppTextStyles.bannerDescription,),
                          Text("${item.title}", style:const TextStyle(
                            shadows: [
                              BoxShadow(
                                color: AppColors.darkGrey,
                                offset: Offset(2, 3),
                                blurRadius: 10,
                              )
                            ],
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
                    .toList(),
                carouselController: controller,
                options: CarouselOptions(
                  viewportFraction: 1,
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      ctr.counter(index);
                    }),
              ),
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ctr.banners.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        ctr.carouselController(controller);
                        ctr.controllers.animateToPage(entry.key);
                        },
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.black1,
                                offset: Offset(1, 3),
                                blurRadius: 5,
                              )
                            ],
                            color: (Theme.of(context).brightness == Brightness.light
                                ? AppColors.white
                                : AppColors.black)
                                .withOpacity(ctr.count == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
              ),
               ),
            ],
          ),
        );
      }
    );
  }
}

