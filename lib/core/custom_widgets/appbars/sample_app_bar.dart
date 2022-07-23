import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';

import '../../theme/app_text_style.dart';

class SampleAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  SampleAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      title: Text(title, style: AppTextStyles.sampleAppBar,),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
