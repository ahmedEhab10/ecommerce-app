import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_entity.dart';

abstract class CartRepository {
  Future<Either<String, void>> addToCart({
    required String productId,
  });
  Future<Either<String, CartEntity>> getCart();
  Future<Either<String, CartEntity>> updateCartProductQuantity({
    required String productId,
    required String quantity,
  });
  Future<Either<String, CartEntity>> deleteProductFromCart({
    required String productId,
  });
  Future<Either<String, void>> clearCart();
}
