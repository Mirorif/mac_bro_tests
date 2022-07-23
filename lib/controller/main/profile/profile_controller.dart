import 'package:get/get.dart';
import 'package:mac_bro_test/data/repository/auth/auth_repository.dart';
import 'package:mac_bro_test/data/repository/home/home_repository.dart';
import '../../../base/base_controller.dart';



class ProfileController extends BaseController with GetSingleTickerProviderStateMixin{
  final AuthRepository? authRepository;
  final HomeRepository repository;

  ProfileController({required this.authRepository, required this.repository});

  }

