class Product {
  String? author;
  String? cover;
  String? createdAt;
  String? description;
  int? id;
  String? name;
  num? price;
  int? sales;
  String? slug;
  LikesAggregate? likesAggregate;

  Product(
      {this.author,
      this.cover,
      this.createdAt,
      this.description,
      this.id,
      this.name,
      this.price,
      this.sales,
      this.slug,
      this.likesAggregate});

  Product.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    cover = json['cover'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    name = json['name'];
    price = json['price'];
    sales = json['sales'];
    slug = json['slug'];
    likesAggregate = json['likes_aggregate'] != null
        ? LikesAggregate.fromJson(json['likes_aggregate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['cover'] = cover;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['sales'] = sales;
    data['slug'] = slug;
    if (likesAggregate != null) {
      data['likes_aggregate'] = likesAggregate!.toJson();
    }
    return data;
  }
}

class LikesAggregate {
  Aggregate? aggregate;

  LikesAggregate({this.aggregate});

  LikesAggregate.fromJson(Map<String, dynamic> json) {
    aggregate = json['aggregate'] != null
        ? Aggregate.fromJson(json['aggregate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aggregate != null) {
      data['aggregate'] = aggregate!.toJson();
    }
    return data;
  }
}

class Aggregate {
  int? count;

  Aggregate({this.count});

  Aggregate.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}
