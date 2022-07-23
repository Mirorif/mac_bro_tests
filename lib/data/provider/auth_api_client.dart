import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mac_bro_test/data/models/auth/user_confirm_request.dart';
import 'package:mac_bro_test/data/models/auth/user_confirm_response.dart';
import 'package:mac_bro_test/data/models/auth/user_generate_request.dart';
import 'package:mac_bro_test/data/models/auth/user_generate_response.dart';
import 'package:mac_bro_test/data/models/auth/user_register_response.dart';
import 'package:retrofit/http.dart';

import '../../base/base_functions.dart';
import '../../core/constants/constants.dart';
import '../../routes/app_routes.dart';
import '../models/auth/user_register_request.dart';
import '../source/local_source.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: AppConstants.authUrl)
abstract class AuthApiClient {
  static Chuck alice = Chuck(
    navigatorKey: AppConstants.navigatorKey,
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    if (kDebugMode) {
      /// chuck interceptor
      dio.interceptors.add(alice.getDioInterceptor());

      /// log
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
        ),
      );
    }

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        toNoInternetPageNavigator: () async =>
            await Get.toNamed(AppRoutes.internetConnection),
        accessTokenGetter: () => LocalSource.instance.getAccessToken(),
        refreshTokenFunction: BaseFunctions.refreshToken,
      ),
    );

    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static AuthApiClient? _authApiClient;

  static AuthApiClient getInstance({String baseUrl = AppConstants.authUrl}) {
    if (_authApiClient != null) {
      return _authApiClient!;
    } else {
      _authApiClient = AuthApiClient(getDio, cancelToken, baseUrl);
      return _authApiClient!;
    }
  }

  static void removeApiClient() {
    _authApiClient = null;
  }

  factory AuthApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _AuthApiClient(dio, baseUrl: baseUrl);
  }

  @POST('auth/passcode/generate')
  Future<UserGenerateResponse> createUserGenerate(
    @Header('platform-id') String platformId,
    @Body() UserGenerateRequest userGenerateRequest,
  );

  @POST('auth/passcode/confirm')
  Future<UserConfirmResponse> createUserConfirm(
    @Header('platform-id') String platformId,
    @Body() UserConfirmRequest userConfirmRequest,
  );

  @POST('auth/user/register')
  Future<UserRegisterResponse> createUserRegister(
      @Body() UserRegisterRequest userRegisterRequest,
      );
}
