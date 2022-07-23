import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/core/constants/constants.dart';
import 'package:mac_bro_test/data/models/auth/user_confirm_request.dart';
import 'package:mac_bro_test/data/models/auth/user_confirm_response.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user_db.dart';
import 'package:mac_bro_test/data/models/auth/user_exists_request.dart';
import 'package:mac_bro_test/data/models/auth/user_generate_request.dart';
import 'package:mac_bro_test/data/models/auth/user_generate_response.dart';
import 'package:mac_bro_test/data/models/auth/user_me_response.dart';
import 'package:mac_bro_test/data/models/auth/user_register_request.dart';
import 'package:mac_bro_test/data/models/auth/user_register_response.dart';
import 'package:mac_bro_test/data/models/auth/user_request.dart';
import 'package:mac_bro_test/data/models/auth/user_response.dart';
import 'package:mac_bro_test/data/repository/auth/auth_repository.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../base/base_controller.dart';
import '../../../data/models/auth/user_db/user.dart';
import '../../../data/models/auth/user_exists_response.dart';

class AuthController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final AuthRepository? authRepository;

  AuthController({this.authRepository});

  bool isActive = false;
  bool isReg = false;
  String? id;
  String? passcodeToken;
  String? accessToken;
  String? generateId;
  String? autoPassword;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    listenOtp();
  }

  @override
  void onReady() async {
    autoPassword = await SmsAutoFill().getAppSignature;
    super.onReady();
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode();
  }

  void isRegistration(bool reg) {
    isReg = reg;
    update();
  }

  String parsePhoneNumber(String phone) {
    return "+998${phone.replaceAll(" ", "")}";
  }

  Future<void> createUser(String firstname, String lastname, String phoneNumber,
      String? accessToken) async {
    var userRequest = UserRequest(
      firstName: firstname,
      lastName: lastname,
      phoneNumber: phoneNumber,
      profileImage: "",
    );
    setLoading(true);
    final result = await authRepository?.createUser(
        auth: "Bearer $accessToken", userRequest: userRequest);
    setLoading(false);
    if (result is UserResponse) {
      id = result.id;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getUserMe(String token) async {
    final result = await authRepository?.getUserMe(token: "Bearer $token");
    if (result is UserMeResponse) {
      var user = Users(
        name: result.firstName!,
        surname: result.lastName!,
        phone: result.phoneNumber!,
      );
      UserDatabase.instance.addUser(user);
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> createUserExists(String phoneNum) async {
    var requestUserExists = UserExistsRequest(phoneNumber: phoneNum);
    setLoading(true);
    final result = await authRepository?.createUserExists(requestUserExists);
    setLoading(false);
    if (result is UserExistsResponse) {
      isActive = result.exists!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> createUserGenerate(String username, String? password) async {
    var userGenerateRequest = UserGenerateRequest(
      password: "",
      tag: password,
      username: username,
      clientTypeId: AppConstants.clientTypeId,
    );
    setLoading(true);
    final result = await authRepository?.createUserGenerate(
        userGenerateRequest: userGenerateRequest);
    setLoading(false);
    if (result is UserGenerateResponse) {
      generateId = result.data?.user?.id;

      passcodeToken = result.data?.passcodeToken;
      debugPrint("==> ${result.data?.passcodeToken}");
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> createUserConfirm(String passcode, String? passcodeToken) async {
    var userConfirmRequest = UserConfirmRequest(
      passcode: passcode,
      passcodeToken: passcodeToken,
    );
    setLoading(true);
    final result = await authRepository?.createUserConfirm(
        userConfirmRequest: userConfirmRequest);
    setLoading(false);

    if (result is UserConfirmResponse) {
      accessToken = result.data!.token!.accessToken;
      await getUserMe(accessToken!);
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> createUserRegister(String phone) async {
    var userRegisterRequest = UserRegisterRequest(
      clientTypeId: AppConstants.clientTypeId,
      roleId: AppConstants.roleId,
      phone: phone,
      email: '',
      password: '',
      login: '',
    );
    setLoading(true);
    final result = await authRepository?.createUserRegister(
        userRegisterRequest: userRegisterRequest);
    setLoading(false);
    if (result is UserRegisterResponse) {
      debugPrint("User register ==> ${result.data}");
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }
}
