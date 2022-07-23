class BannersResponse {
  List<Banners>? banners;
  String? count;

  BannersResponse({this.banners, this.count});

  BannersResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Banners {
  bool? active;
  String? buttonTitle;
  String? description;
  String? id;
  String? image;
  String? lang;
  Position? position;
  int? price;
  String? slug;
  String? title;
  String? type;
  String? url;

  Banners(
      {this.active,
        this.buttonTitle,
        this.description,
        this.id,
        this.image,
        this.lang,
        this.position,
        this.price,
        this.slug,
        this.title,
        this.type,
        this.url});

  Banners.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    buttonTitle = json['button_title'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    lang = json['lang'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    price = json['price'];
    slug = json['slug'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['button_title'] = this.buttonTitle;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['lang'] = this.lang;
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    data['price'] = this.price;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Position {
  bool? active;
  String? createdAt;
  String? description;
  String? id;
  String? size;
  String? slug;
  String? title;
  String? updatedAt;

  Position(
      {this.active,
        this.createdAt,
        this.description,
        this.id,
        this.size,
        this.slug,
        this.title,
        this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    size = json['size'];
    slug = json['slug'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['size'] = this.size;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}