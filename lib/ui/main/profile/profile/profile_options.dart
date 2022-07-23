import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/theme/app_utils.dart';

class ProfileOptions extends StatelessWidget {
  final String image;
  final String title;
  final Function()? onTap;

  const ProfileOptions({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppUtils.kAllPadding16,
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/$image.svg', color: AppColors.blue,),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,style: AppTextStyles.appBarTitle,),
                      const Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
