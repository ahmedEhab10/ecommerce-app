import 'package:ecommerce_app/features/products_screen/data/Models/Product_ressponse.dart';
import 'package:ecommerce_app/features/products_screen/data/Models/sub_catogry.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';

class Product {
  final num? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final num? quantity;
  final num? price;
  final String? imageCover;
  final Category? category;

  final num? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  final num? priceAfterDiscount;

  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: (json['sold'] as num?)?.toInt(),
      images: json['images'].cast<String>(),
      subcategory: json['subcategory'] != null
          ? (json['subcategory'] as List)
              .map((i) => Subcategory.fromJson(i))
              .toList()
          : null,
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      imageCover: json['imageCover'],
      category: json['category'] != null
          ? new Category.fromJson(json['category'])
          : null,
      ratingsAverage: json['ratingsAverage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      priceAfterDiscount: json['priceAfterDiscount'],
    );
  }

  ProductEntity toproductEntity() {
    return ProductEntity(
        sold: sold ?? 100,
        images: images!,
        ratingsQuantity: ratingsQuantity!,
        id: id!,
        title: title!,
        slug: slug!,
        description: description!,
        quantity: quantity!,
        price: price!,
        imageCover: imageCover!,
        category: category!,
        ratingsAverage: ratingsAverage!,
        priceAfterDiscount: priceAfterDiscount ?? 0);
  }
}
