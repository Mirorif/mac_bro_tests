class ProductResponse {
  String? count;
  List< Product>? products;

  ProductResponse({this.count, this.products});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  bool? active;
  int? cheapestPrice;
  String? code;
  int? discount;
  String? id;
  String? image;
  String? name;
  String? order;
  Price? price;
  String? slug;

  Product(
      {this.active,
        this.cheapestPrice,
        this.code,
        this.discount,
        this.id,
        this.image,
        this.name,
        this.order,
        this.price,
        this.slug});

  Product.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    cheapestPrice = json['cheapest_price'];
    code = json['code'];
    discount = json['discount'];
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
    data['discount'] = this.discount;
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