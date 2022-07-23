import 'package:get/get.dart';
import 'package:mac_bro_test/data/provider/api_client.dart';
import 'package:mac_bro_test/data/provider/auth_api_client.dart';
import 'package:mac_bro_test/data/repository/auth/auth_repository.dart';

import '../controller/auth/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      fenix: true,
        () => AuthController(
            authRepository: AuthRepository(
                apiClient: ApiClient.getInstance(),
                authApiClient: AuthApiClient.getInstance())));
  }
}
