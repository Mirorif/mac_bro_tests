class CategoryResponse {
  List<Categories>? categories;
  String? count;

  CategoryResponse({this.categories, this.count});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Categories {
  bool? active;
  List<Children>? children;
  String? description;
  String? id;
  String? image;
  String? name;
  String? order;
  String? slug;
  String? tradeInImage;
  bool? wide;

  Categories(
      {this.active,
        this.children,
        this.description,
        this.id,
        this.image,
        this.name,
        this.order,
        this.slug,
        this.tradeInImage,
        this.wide});

  Categories.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    order = json['order'];
    slug = json['slug'];
    tradeInImage = json['trade_in_image'];
    wide = json['wide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['order'] = this.order;
    data['slug'] = this.slug;
    data['trade_in_image'] = this.tradeInImage;
    data['wide'] = this.wide;
    return data;
  }
}

class Children {
  bool? active;
  List<Children>? children;
  String? createdAt;
  String? description;
  String? id;
  String? image;
  String? name;
  String? order;
  String? slug;
  String? tradeInImage;
  String? updatedAt;

  Children(
      {this.active,
        this.children,
        this.createdAt,
        this.description,
        this.id,
        this.image,
        this.name,
        this.order,
        this.slug,
        this.tradeInImage,
        this.updatedAt});

  Children.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
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
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
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
