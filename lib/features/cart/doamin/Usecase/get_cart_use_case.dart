import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_entity.dart';
import 'package:ecommerce_app/features/cart/doamin/repositories/cart_repository.dart';

class GetCartUseCase {
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});
  Future<Either<String, CartEntity>> call() {
    return cartRepository.getCart();
  }
}
