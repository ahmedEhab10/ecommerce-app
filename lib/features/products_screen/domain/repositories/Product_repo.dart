import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';

abstract class ProductRepo {
  Future<Either<String, List<ProductEntity>>> getProducts([String? categoryId]);
}
