import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mac_bro_test/core/constants/app_keys.dart';
import 'package:mac_bro_test/core/constants/constants.dart';
import 'package:mac_bro_test/data/models/auth/user_confirm_request.dart';
import 'package:mac_bro_test/data/models/auth/user_confirm_response.dart';
import 'package:mac_bro_test/data/models/auth/user_exists_request.dart';
import 'package:mac_bro_test/data/models/auth/user_exists_response.dart';
import 'package:mac_bro_test/data/models/auth/user_generate_request.dart';
import 'package:mac_bro_test/data/models/auth/user_generate_response.dart';
import 'package:mac_bro_test/data/models/auth/user_me_response.dart';
import 'package:mac_bro_test/data/models/auth/user_register_request.dart';
import 'package:mac_bro_test/data/models/auth/user_register_response.dart';
import 'package:mac_bro_test/data/models/auth/user_request.dart';
import 'package:mac_bro_test/data/models/auth/user_response.dart';
import 'package:mac_bro_test/data/provider/api_client.dart';

import '../../../base/base_repository.dart';
import '../../models/products/product_response.dart';
import '../../provider/auth_api_client.dart';
import '../../provider/response_handler.dart';
import '../../provider/server_error.dart';

class AuthRepository extends BaseRepository {
  final ApiClient? apiClient;
  final AuthApiClient? authApiClient;

  AuthRepository({required this.apiClient, this.authApiClient});

  Future<ResponseHandler<UserResponse>> _fetchCreateUser(
      {required String? auth, required UserRequest userRequest}) async {
    UserResponse response;
    try {
      response =
          await apiClient!.createUser(AppConstants.platformId, auth!, userRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> createUser({required String? auth,required UserRequest userRequest}) async {
    final response = await _fetchCreateUser(auth: auth,userRequest: userRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<UserExistsResponse>> _fetchCreateUserExists(
      UserExistsRequest userExistsRequest) async {
    UserExistsResponse response;
    try {
      response = await apiClient!.createUserExists(userExistsRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> createUserExists(UserExistsRequest userExistsRequest) async {
    final response = await _fetchCreateUserExists(userExistsRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<UserGenerateResponse>> _fetchCreateUserGenerate(
      {required UserGenerateRequest userGenerateRequest}) async {
    UserGenerateResponse response;
    try {
      response =
      await authApiClient!.createUserGenerate(AppConstants.platformId, userGenerateRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> createUserGenerate({required UserGenerateRequest userGenerateRequest}) async {
    final response = await _fetchCreateUserGenerate(userGenerateRequest: userGenerateRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<UserConfirmResponse>> _fetchCreateUserConfirm(
      {required UserConfirmRequest userConfirmRequest}) async {
    UserConfirmResponse response;
    try {
      response =
      await authApiClient!.createUserConfirm(AppConstants.platformId, userConfirmRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> createUserConfirm({required UserConfirmRequest userConfirmRequest}) async {
    final response = await _fetchCreateUserConfirm(userConfirmRequest: userConfirmRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<UserRegisterResponse>> _fetchCreateUserRegister(
      {required UserRegisterRequest userRegisterRequest}) async {
    UserRegisterResponse response;
    try {
      response =
      await authApiClient!.createUserRegister( userRegisterRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> createUserRegister({required UserRegisterRequest userRegisterRequest}) async {
    final response = await _fetchCreateUserRegister(userRegisterRequest: userRegisterRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<UserMeResponse>> _fetchUserMe(
      {required String token}) async {
    UserMeResponse response;
    try {
      response = await apiClient!.getUserMe(AppConstants.platformId, token);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getUserMe({required String token}) async {
    final response = await _fetchUserMe(token: token);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

}
