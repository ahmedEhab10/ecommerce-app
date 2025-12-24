import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/Fav_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/Entities/Fav_product_entity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/Fav_repository.dart';

class FavRepoImpl implements FavRepository {
  FavRemoteDataSource favRemoteDataSource;
  FavRepoImpl({required this.favRemoteDataSource});
  @override
  Future<Either<String, void>> addToFav({required String productId}) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final result = await favRemoteDataSource.addToFav(
          productId: productId, usertoken: token);
      return Right(null);
    } on RemoteAppException catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<FavProductEntity>>> getFavProducts() async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final result = await favRemoteDataSource.getFavlist(usertoken: token);
      return Right(result.productdata!
          .map((product) => product.toFavProductEntity())
          .toList());
    } on RemoteAppException catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> removeFromFav(
      {required String productId}) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final result = await favRemoteDataSource.removeFromFav(
          productId: productId, usertoken: token);
      return Right(null);
    } on RemoteAppException catch (e) {
      return Left(e.toString());
    }
  }
}
