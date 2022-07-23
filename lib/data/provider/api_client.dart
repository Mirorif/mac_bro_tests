import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mac_bro_test/data/models/auth/user_exists_request.dart';
import 'package:mac_bro_test/data/models/auth/user_me_response.dart';
import 'package:mac_bro_test/data/models/category/categories_response.dart';
import 'package:mac_bro_test/data/models/new/future_list_response.dart';
import 'package:mac_bro_test/data/models/new/new_response.dart';
import 'package:mac_bro_test/data/models/products/product_response.dart';
import 'package:mac_bro_test/data/models/products/product_variant_response.dart';
import 'package:retrofit/http.dart';

import '../../base/base_functions.dart';
import '../../core/constants/constants.dart';
import '../../routes/app_routes.dart';
import '../models/auth/user_exists_response.dart';
import '../models/auth/user_generate_request.dart';
import '../models/auth/user_generate_response.dart';
import '../models/auth/user_request.dart';
import '../models/auth/user_response.dart';
import '../models/banners/banner_response.dart';
import '../source/local_source.dart';
import '../token/refresh_token_request.dart';
import '../token/refresh_token_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
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

    /// Tries the last error request again.
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

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = AppConstants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  static void removeApiClient() {
    _apiClient = null;
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('banner')
  Future<BannersResponse> getBanners(
    @Query('lang') String lang,
    @Query('limit') String limit,
  );

  @GET('category')
  Future<CategoryResponse> getCategories(
    @Query('lang') String lang,
    @Query('limit') String limit,
  );

  @GET('featured-list')
  Future<FeatureListResponse> getFeaturedList(
    @Query('lang') String lang,
    @Query('limit') String limit,
  );

  @GET('product')
  Future<ProductResponse> getProducts(
    @Query('search') String search,
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('lang') String lang,
  );

  @GET('product')
  Future<ProductResponse> getProductByBrand(
    @Query('category') String category,
    @Query('lang') String lang,
    @Query('limit') String limit,
    @Query('page') String page,
  );

  @GET('product-variant')
  Future<ProductVariantsResponse> getProductVariant(
    @Query('active') bool active,
    @Query('lang') String lang,
    @Query('category') String category,
    @Query('limit') String limit,
    @Query('page') String page,
  );

  @POST('user')
  Future<UserResponse> createUser(
    @Header('platform-id') String platformId,
    @Header('authorization') String auth,
    @Body() UserRequest userRequest,
  );

  @GET('user/me')
  Future<UserMeResponse> getUserMe(
    @Header('platform-id') String platformId,
    @Header('authorization') String auth,
  );

  @POST('user/exists')
  Future<UserExistsResponse> createUserExists(
    @Body() UserExistsRequest userExistsRequest,
  );

  @GET('customers/refresh-token')
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );
}
