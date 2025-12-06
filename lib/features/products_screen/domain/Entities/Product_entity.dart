import 'package:ecommerce_app/features/main_layout/home/data/Models/Brand_ressponse/Brand.dart';
import 'package:ecommerce_app/features/products_screen/data/Models/Product_ressponse.dart';

class ProductEntity {
  final num sold;
  final List<String> images;

  final num ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final num quantity;
  final num price;
  final String imageCover;
  final Category category;

  final num ratingsAverage;

  final num? priceAfterDiscount;

  ProductEntity(
      {required this.sold,
      required this.images,
      required this.ratingsQuantity,
      required this.id,
      required this.title,
      required this.slug,
      required this.description,
      required this.quantity,
      required this.price,
      required this.imageCover,
      required this.category,
      required this.ratingsAverage,
      required this.priceAfterDiscount});
}
