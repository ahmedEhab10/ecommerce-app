import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/Fav_repository.dart';

class AddTofavUsecase {
  final FavRepository favRepository;
  AddTofavUsecase({required this.favRepository});

  Future<Either<String, void>> call({required String productId}) {
    return favRepository.addToFav(productId: productId);
  }
}
