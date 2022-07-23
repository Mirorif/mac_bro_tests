import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  final String firstname;
  final String lastname;
  final String phoneNumber;
  ProfileAppBar({Key? key, required this.phoneNumber, required this.lastname, required this.firstname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      title: ListView(
        shrinkWrap: true,
       // physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(lastname, style: AppTextStyles.profileTitle,),
          Text(firstname, style: AppTextStyles.profileTitle,),
          Text(phoneNumber, style: AppTextStyles.profileNumberTitle,),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(128);
}