import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_entity.dart';
import 'package:ecommerce_app/features/cart/doamin/repositories/cart_repository.dart';

class UpdateCartProductQuantityUseCase {
  CartRepository cartRepository;
  UpdateCartProductQuantityUseCase({required this.cartRepository});
  Future<Either<String, CartEntity>> call(
      {required String productId, required String quantity}) {
    return cartRepository.updateCartProductQuantity(
        productId: productId, quantity: quantity);
  }
}
