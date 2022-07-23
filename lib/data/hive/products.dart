import 'package:hive/hive.dart';

part 'products.g.dart';

@HiveType(typeId: 1, adapterName: "ProductAdapter")
class Products extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? price;

  @HiveField(3)
  final String? image;

  Products({
    required this.id,
    this.image,
    this.name,
    this.price,
  });
}
