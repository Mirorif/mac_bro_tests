import 'package:get/get.dart';
import '../../base/base_controller.dart';
import '../../routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offNamed(AppRoutes.main);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
