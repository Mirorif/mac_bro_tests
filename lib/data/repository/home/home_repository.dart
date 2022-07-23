import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mac_bro_test/base/base_repository.dart';
import 'package:mac_bro_test/data/models/category/categories_response.dart';
import 'package:mac_bro_test/data/models/new/future_list_response.dart';
import 'package:mac_bro_test/data/models/new/new_response.dart';
import 'package:mac_bro_test/data/models/products/product_response.dart';
import 'package:mac_bro_test/data/models/products/product_variant_response.dart';
import 'package:mac_bro_test/data/source/local_source.dart';

import '../../models/banners/banner_response.dart';
import '../../provider/api_client.dart';
import '../../provider/response_handler.dart';
import '../../provider/server_error.dart';

class HomeRepository extends BaseRepository{

  ApiClient? apiClient;
  String lang = LocalSource.instance.getLocale();

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ResponseHandler<BannersResponse>> _fetchBanners() async {
    BannersResponse response;
    try {
      response = await apiClient!.getBanners(lang, "20");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners() async {
    final response =
    await _fetchBanners();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }


  Future<ResponseHandler<CategoryResponse>> _fetchCategories() async {
    CategoryResponse response;
    try {
      response = await apiClient!.getCategories(lang, "100");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategories() async {
    final response =
    await _fetchCategories();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<FeatureListResponse>> _fetchFeaturedList() async {
    FeatureListResponse response;
    try {
      response = await apiClient!.getFeaturedList(lang, "20");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getFeaturedList() async {
    final response =
    await _fetchFeaturedList();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<ProductResponse>> _fetchSearchProducts(
      {
        required String search,
        int page = 1,
        int limit = 1000}) async {
    ProductResponse response;
    try {
      response = await apiClient!.getProducts( search, page, limit, lang);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getSearchProducts(
      {
        required String search,
        int limit = 1000,
        int page = 1}) async {
    final response = await _fetchSearchProducts(
        search: search, limit: limit, page: page);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<ProductResponse>> _fetchProductByBrand(
      {required String category, required String lang}) async {
    ProductResponse response;
    try {
      response = await apiClient!.getProductByBrand(category, lang, "100", "1");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductByBrand({required String category}) async {
    final response = await _fetchProductByBrand(category: category,  lang: lang);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<ProductVariantsResponse>> _fetchProductVariant(
      {required String category}) async {
    ProductVariantsResponse response;
    try {
      response = await apiClient!.getProductVariant(true, lang, category, "1000", "1");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductVariant({required String category}) async {
    final response = await _fetchProductVariant(category: category);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

}
