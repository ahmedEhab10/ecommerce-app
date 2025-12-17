import 'package:ecommerce_app/features/cart/data/Models/CartResponse.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({required String productId, required String token});
  Future<CartResponse> getCart({required String token});
  Future<CartResponse> updateCartProductQuantity(
      {required String productId,
      required String quantity,
      required String token});
  Future<CartResponse> deleteProductFromCart(
      {required String productId, required String token});
  Future<void> clearCart({required String token});
}
