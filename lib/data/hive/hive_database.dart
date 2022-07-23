import 'package:hive/hive.dart';

import '../../core/constants/app_keys.dart';
import '../models/auth/user_db/user.dart';
import 'products.dart';

class HiveDatabase {
  static Box<Products>? boxFavourite;
  static HiveDatabase instance = HiveDatabase._();

  HiveDatabase._();

  static Future<HiveDatabase> getInstance() async {
    boxFavourite ??= await Hive.openBox<Products>(AppKeys.db);
    return instance;
  }

  List<Products> products() {
    return (boxFavourite?.values ?? []).toList();
  }

  Future<void> addProduct(Products product) async {
    await boxFavourite?.put(product.id, product);
  }


  Future<void> updateProduct(Products product, bool isMinus) async {
    if (isMinus) {
      await boxFavourite?.put(
        product.id,
        Products(
          id: product.id,
          price: product.price,
          name: product.name,
          image: product.image,
        ),
      );
    } else {
      await boxFavourite?.put(
        product.id,
        Products(
          id: product.id,
          price: product.price,
          name: product.name,
          image: product.image,
        ),
      );
    }
  }

  Future<void> deleteProduct(String id) async {
    await boxFavourite?.delete(id);
  }

  Future<void> clearProduct() async {
    await boxFavourite?.clear();
  }
}
