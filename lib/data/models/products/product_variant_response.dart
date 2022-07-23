class ProductVariantsResponse {
  String? count;
  List<ProductVariants>? productVariants;

  ProductVariantsResponse({this.count, this.productVariants});

  ProductVariantsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['product_variants'] != null) {
      productVariants = <ProductVariants>[];
      json['product_variants'].forEach((v) {
        productVariants!.add(new ProductVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.productVariants != null) {
      data['product_variants'] =
          this.productVariants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductVariants {
  bool? active;
  int? cheapestPrice;
  String? code;
  String? id;
  String? image;
  String? name;
  String? order;
  Price? price;
  String? slug;

  ProductVariants(
      {this.active,
        this.cheapestPrice,
        this.code,
        this.id,
        this.image,
        this.name,
        this.order,
        this.price,
        this.slug});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    cheapestPrice = json['cheapest_price'];
    code = json['code'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    order = json['order'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['cheapest_price'] = this.cheapestPrice;
    data['code'] = this.code;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['slug'] = this.slug;
    return data;
  }
}

class Price {
  int? oldPrice;
  int? secondPrice;
  int? secondUzsPrice;
  int? uzsPrice;

  Price(
      {this.oldPrice,
        this.secondPrice,
        this.secondUzsPrice,
        this.uzsPrice});

  Price.fromJson(Map<String, dynamic> json) {
    oldPrice = json['old_price'];
    secondPrice = json['second_price'];
    secondUzsPrice = json['second_uzs_price'];
    uzsPrice = json['uzs_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_price'] = this.oldPrice;
    data['second_price'] = this.secondPrice;
    data['second_uzs_price'] = this.secondUzsPrice;
    data['uzs_price'] = this.uzsPrice;
    return data;
  }
}
