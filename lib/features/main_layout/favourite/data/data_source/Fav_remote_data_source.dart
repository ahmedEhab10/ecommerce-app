import 'package:ecommerce_app/features/main_layout/favourite/data/Models/get_fav_ressponse.dart';

abstract class FavRemoteDataSource {
  Future<void> addToFav({required String productId, required String usertoken});

  Future<void> removeFromFav(
      {required String productId, required String usertoken});

  Future<get_fav_ressponse> getFavlist({required String usertoken});
}
