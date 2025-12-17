import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/doamin/repositories/cart_repository.dart';

class AddToCartUseCase {
  CartRepository cartRepository;
  AddToCartUseCase({required this.cartRepository});
  Future<Either<String, void>> call({required String productId}) {
    return cartRepository.addToCart(productId: productId);
  }
}
