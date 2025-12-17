import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/doamin/repositories/cart_repository.dart';

class ClearCartUseCase {
  CartRepository cartRepository;
  ClearCartUseCase({required this.cartRepository});
  Future<Either<String, void>> call() {
    return cartRepository.clearCart();
  }
}
