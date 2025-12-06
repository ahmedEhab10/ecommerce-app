import 'package:ecommerce_app/features/products_screen/data/Models/Product.dart';

class Product_ressponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? products;

  Product_ressponse({this.results, this.metadata, this.products});

  factory Product_ressponse.fromJson(Map<String, dynamic> json) {
    return Product_ressponse(
        results: json['results'],
        metadata: json['metadata'] != null
            ? new Metadata.fromJson(json['metadata'])
            : null,
        products: json['data'] != null
            ? (json['data'] as List).map((i) => Product.fromJson(i)).toList()
            : null);
  }
}

class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
      nextPage: json['nextPage'],
    );
  }
}

class Category {
  final String? sId;
  final String? name;
  final String? slug;
  final String? image;

  Category({this.sId, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}
