import 'package:get/get.dart';
import 'package:mac_bro_test/controller/main/favorite/favorite_controller.dart';
import 'package:mac_bro_test/controller/main/profile/profile_controller.dart';
import 'package:mac_bro_test/data/provider/auth_api_client.dart';
import 'package:mac_bro_test/data/repository/auth/auth_repository.dart';

import '../controller/main/home/home_controller.dart';
import '../controller/main/main_controller.dart';
import '../data/provider/api_client.dart';
import '../data/repository/home/home_repository.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(
        () => HomeController(
            repository: HomeRepository(apiClient: ApiClient.getInstance())),
        fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(
        () => ProfileController(
            authRepository: AuthRepository(
                authApiClient: AuthApiClient.getInstance(),
                apiClient: ApiClient.getInstance()),
            repository: HomeRepository(apiClient: ApiClient.getInstance())),
        fenix: true);
  }
}
