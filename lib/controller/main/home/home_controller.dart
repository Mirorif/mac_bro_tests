import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mac_bro_test/base/base_controller.dart';
import 'package:mac_bro_test/data/models/category/categories_response.dart';
import 'package:mac_bro_test/data/models/new/future_list_response.dart';
import 'package:mac_bro_test/data/models/products/product_variant_response.dart';
import 'package:mac_bro_test/data/repository/home/home_repository.dart';
import '../../../core/constants/app_keys.dart';
import '../../../data/hive/hive_database.dart';
import '../../../data/hive/products.dart' as db;
import '../../../data/models/banners/banner_response.dart';
import '../../../data/models/products/product_response.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;
  int count = 0;
  bool active = Hive.box<db.Products>(AppKeys.db).isNotEmpty ? true : false;
  CarouselController controllers = CarouselController();

  HomeController({required this.repository});

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<FeaturedLists> _featured = [];
  List<Product> _product = [];
  List<ProductVariants> _productVariants = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    setLoading(true);
    await getBanners();
    await getFeaturedList();
    await getCategories();
    setLoading(false);
    super.onReady();
  }

  Future<void> getBanners() async {
    final result = await repository?.getBanners();
    if (result is BannersResponse) {
      // result.banners!.removeWhere((element) => element.position!.title != 'slider');
       result.banners!.removeWhere((element) => element.type! != 'image');
      _banners = result.banners!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getCategories() async {
    final result = await repository?.getCategories();
    if (result is CategoryResponse) {
      _categories = result.categories ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getFeaturedList() async {
    final result = await repository?.getFeaturedList();
    if (result is FeatureListResponse) {
      _featured = result.featuredLists!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getProductByBrand(String category) async {
    setLoading(true);
    final result =
        await repository?.getProductByBrand(category: category);
    setLoading(false);
    if (result is ProductResponse) {
      _product = result.products ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getProductVariant(String category, String lang) async {
    setLoading(true);
    final result =
        await repository?.getProductVariant(category: category);
    setLoading(false);
    if (result is ProductVariantsResponse) {
      _productVariants = result.productVariants ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<List<Product>> searchProduct(String? search) async {
    setLoading(true);
    final result = await repository?.getSearchProducts(
      search: search ?? '',
    );
    setLoading(false);
    if (result is ProductResponse) {
      return result.products ?? [];
    } else {
      Get.snackbar('error'.tr, result.toString());
      return [];
    }
  }

  List<Banners> get banners => _banners;

  List<Categories> get categories => _categories;

  List<FeaturedLists> get featured => _featured;

  List<Product> get product => _product;

  List<ProductVariants> get productVariant => _productVariants;

  void carouselController(CarouselController controller) {
    controllers = controller;
    update();
  }

  void counter(int index) {
    count = index;
    update();
  }

  void checkFavorite(String id, String name, String image, String price) {
    if (HiveDatabase.boxFavourite?.containsKey(id) == true) {
      HiveDatabase.instance.deleteProduct(id);
      active = false;
    } else {
      HiveDatabase.instance.addProduct(
        db.Products(
          id: id,
          image: image,
          name: name,
          price: price,
        ),
      );
      active = true;
    }
    update();
  }

  void activeBool(bool act){
    active = act;
    update();
  }
}
