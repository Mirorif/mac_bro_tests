import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/splash/splash_controller.dart';
import '../../core/paints/icon_logo_painter.dart';
import '../../core/theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (ctr) => Scaffold(
        body: Center(child: SvgPicture.asset("assets/svg/macBro.svg"))
      ),
    );
  }
}
