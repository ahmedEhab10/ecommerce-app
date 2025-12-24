import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/Entities/Fav_product_entity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/Fav_repository.dart';

class GetFavListUseCase {
  FavRepository favRepository;
  GetFavListUseCase({required this.favRepository});
  Future<Either<String, List<FavProductEntity>>> call() {
    return favRepository.getFavProducts();
  }
}
