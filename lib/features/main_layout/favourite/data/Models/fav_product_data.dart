import 'package:ecommerce_app/features/main_layout/favourite/data/Models/Category.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/Entities/Fav_product_entity.dart';
import 'package:ecommerce_app/features/products_screen/data/Models/sub_catogry.dart';

class FavProductData {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final num? price;
  final String? imageCover;
  final Category? category;
  final Category? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  FavProductData({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });

  factory FavProductData.fromJson(Map<String, dynamic> json) {
    return FavProductData(
      id: json['_id'],
      sold: json['sold'],
      images: json['images'].cast<String>(),
      subcategory: json['subcategory'] != null
          ? (json['subcategory'] as List)
              .map((i) => Subcategory.fromJson(i))
              .toList()
          : null,
      ratingsQuantity: json['ratingsQuantity'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      imageCover: json['imageCover'],
      category: json['category'] != null
          ? new Category.fromJson(json['category'])
          : null,
      brand:
          json['brand'] != null ? new Category.fromJson(json['brand']) : null,
      ratingsAverage: json['ratingsAverage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
  FavProductEntity toFavProductEntity() => FavProductEntity(
        id: id,
        title: title,
        description: description,
        image: imageCover,
        price: price,
        quantity: quantity,
        imageCover: imageCover,
        ratingsAverage: ratingsAverage,
      );
}
