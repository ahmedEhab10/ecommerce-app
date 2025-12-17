import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_entity.dart';
import 'package:ecommerce_app/features/cart/doamin/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<String, void>> addToCart({
    required String productId,
  }) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final response =
          await remoteDataSource.addToCart(productId: productId, token: token);
      return Right(null);
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }

  @override
  Future<Either<String, CartEntity>> getCart() async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.getCart(token: token);
      return Right(response.cart.toCartEntity());
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }

  @override
  Future<Either<String, CartEntity>> updateCartProductQuantity({
    required String productId,
    required String quantity,
  }) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.updateCartProductQuantity(
          productId: productId, quantity: quantity, token: token);
      return Right(response.cart.toCartEntity());
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }

  @override
  Future<Either<String, CartEntity>> deleteProductFromCart({
    required String productId,
  }) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.deleteProductFromCart(
          productId: productId, token: token);
      return Right(response.cart.toCartEntity());
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }

  @override
  Future<Either<String, void>> clearCart() async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.clearCart(token: token);
      return Right(null);
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }
}
