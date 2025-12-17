import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_entity.dart';
import 'package:ecommerce_app/features/cart/doamin/repositories/cart_repository.dart';

class DeleteProductFromCartUseCase {
  CartRepository cartRepository;
  DeleteProductFromCartUseCase({required this.cartRepository});
  Future<Either<String, CartEntity>> call({required String productId}) {
    return cartRepository.deleteProductFromCart(productId: productId);
  }
}
