import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  bool _isLoading = false;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;
}
