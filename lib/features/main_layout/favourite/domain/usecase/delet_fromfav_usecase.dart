import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/Fav_repository.dart';

class DeletFromfavUsecase {
  FavRepository favRepository;
  DeletFromfavUsecase({required this.favRepository});

  Future<Either<String, void>> call({required String productId}) {
    return favRepository.removeFromFav(productId: productId);
  }
}
