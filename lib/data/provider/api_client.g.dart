// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.client.macbro.uz/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BannersResponse> getBanners(lang, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang, r'limit': limit};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BannersResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'banner',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BannersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryResponse> getCategories(lang, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang, r'limit': limit};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'category',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FeatureListResponse> getFeaturedList(lang, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang, r'limit': limit};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FeatureListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'featured-list',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FeatureListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductResponse> getProducts(search, page, limit, lang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'page': page,
      r'limit': limit,
      r'lang': lang
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductResponse> getProductByBrand(category, lang, limit, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': category,
      r'lang': lang,
      r'limit': limit,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductVariantsResponse> getProductVariant(
      active, lang, category, limit, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'active': active,
      r'lang': lang,
      r'category': category,
      r'limit': limit,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductVariantsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product-variant',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductVariantsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResponse> createUser(platformId, auth, userRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'platform-id': platformId,
      r'authorization': auth
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(userRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserMeResponse> getUserMe(platformId, auth) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'platform-id': platformId,
      r'authorization': auth
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserMeResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/me',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserMeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserExistsResponse> createUserExists(userExistsRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userExistsRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserExistsResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/exists',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserExistsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RefreshTokenResponse> refreshToken(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RefreshTokenResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'customers/refresh-token',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RefreshTokenResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
