import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/Entities/Fav_product_entity.dart';

abstract class FavRepository {
  Future<Either<String, List<FavProductEntity>>> getFavProducts();
  Future<Either<String, void>> addToFav({required String productId});
  Future<Either<String, void>> removeFromFav({required String productId});
}
