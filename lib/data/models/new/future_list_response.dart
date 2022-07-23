class FeatureListResponse {
  String? count;
  List<FeaturedLists>? featuredLists;

  FeatureListResponse({this.count, this.featuredLists});

  FeatureListResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['featured_lists'] != null) {
      featuredLists = <FeaturedLists>[];
      json['featured_lists'].forEach((v) {
        featuredLists!.add(new FeaturedLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.featuredLists != null) {
      data['featured_lists'] =
          this.featuredLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedLists {
  bool? active;
  String? createdAt;
  String? description;
  String? id;
  String? lang;
  String? order;
  List<Products>? products;
  String? slug;
  String? title;

  FeaturedLists(
      {this.active,
        this.createdAt,
        this.description,
        this.id,
        this.lang,
        this.order,
        this.products,
        this.slug,
        this.title});

  FeaturedLists.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    lang = json['lang'];
    order = json['order'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    slug = json['slug'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['lang'] = this.lang;
    data['order'] = this.order;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['title'] = this.title;
    return data;
  }
}

class Products {
  bool? active;
  Brand? brand;
  Category? category;
  int? cheapestPrice;
  String? code;
  String? createdAt;
  String? externalId;
  String? id;
  String? image;
  InStock? inStock;
  String? name;
  String? order;
  String? previewText;
  Price? price;
  List<Prices>? prices;
  String? slug;
  String? updatedAt;

  Products(
      {this.active,
        this.brand,
        this.category,
        this.cheapestPrice,
        this.code,
        this.createdAt,
        this.externalId,
        this.id,
        this.image,
        this.inStock,
        this.name,
        this.order,
        this.previewText,
        this.price,
        this.prices,
        this.slug,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    cheapestPrice = json['cheapest_price'];
    code = json['code'];
    createdAt = json['created_at'];
    externalId = json['external_id'];
    id = json['id'];
    image = json['image'];
    inStock =
    json['inStock'] != null ? new InStock.fromJson(json['inStock']) : null;
    name = json['name'];
    order = json['order'];
    previewText = json['preview_text'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
    slug = json['slug'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['cheapest_price'] = this.cheapestPrice;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['external_id'] = this.externalId;
    data['id'] = this.id;
    data['image'] = this.image;
    if (this.inStock != null) {
      data['inStock'] = this.inStock!.toJson();
    }
    data['name'] = this.name;
    data['order'] = this.order;
    data['preview_text'] = this.previewText;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  bool? active;
  String? createdAt;
  String? description;
  String? id;
  String? image;
  String? name;
  String? previewText;
  String? slug;
  String? updatedAt;

  Brand(
      {this.active,
        this.createdAt,
        this.description,
        this.id,
        this.image,
        this.name,
        this.previewText,
        this.slug,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    previewText = json['preview_text'];
    slug = json['slug'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['preview_text'] = this.previewText;
    data['slug'] = this.slug;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  bool? active;
  String? id;
  String? image;
  String? name;
  String? order;
  Parent? parent;
  String? slug;

  Category(
      {this.active,
        this.id,
        this.image,
        this.name,
        this.order,
        this.parent,
        this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    order = json['order'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['slug'] = this.slug;
    return data;
  }
}

class Parent {
  bool? active;
  String? createdAt;
  String? description;
  String? id;
  String? image;
  String? name;
  String? order;
  String? slug;
  String? tradeInImage;
  String? updatedAt;

  Parent(
      {this.active,
        this.createdAt,
        this.description,
        this.id,
        this.image,
        this.name,
        this.order,
        this.slug,
        this.tradeInImage,
        this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    order = json['order'];
    slug = json['slug'];
    tradeInImage = json['trade_in_image'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['order'] = this.order;
    data['slug'] = this.slug;
    data['trade_in_image'] = this.tradeInImage;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class InStock {
  bool? samarkand;
  bool? tashkentCity;

  InStock({this.samarkand, this.tashkentCity});

  InStock.fromJson(Map<String, dynamic> json) {
    samarkand = json['samarkand'];
    tashkentCity = json['tashkent_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['samarkand'] = this.samarkand;
    data['tashkent_city'] = this.tashkentCity;
    return data;
  }
}

class Price {
  int? oldPrice;
  int? price;
  int? secondPrice;
  int? secondUzsPrice;
  int? uzsPrice;

  Price(
      {this.oldPrice,
        this.price,
        this.secondPrice,
        this.secondUzsPrice,
        this.uzsPrice});

  Price.fromJson(Map<String, dynamic> json) {
    oldPrice = json['old_price'];
    price = json['price'];
    secondPrice = json['second_price'];
    secondUzsPrice = json['second_uzs_price'];
    uzsPrice = json['uzs_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_price'] = this.oldPrice;
    data['price'] = this.price;
    data['second_price'] = this.secondPrice;
    data['second_uzs_price'] = this.secondUzsPrice;
    data['uzs_price'] = this.uzsPrice;
    return data;
  }
}

class Prices {
  String? id;
  int? oldPrice;
  int? price;
  int? secondPrice;
  String? type;

  Prices({this.id, this.oldPrice, this.price, this.secondPrice, this.type});

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    oldPrice = json['old_price'];
    price = json['price'];
    secondPrice = json['second_price'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['old_price'] = this.oldPrice;
    data['price'] = this.price;
    data['second_price'] = this.secondPrice;
    data['type'] = this.type;
    return data;
  }
}