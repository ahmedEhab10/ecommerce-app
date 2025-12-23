part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}


class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  String message;

  AddToCartError({required this.message});
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  String message;

  GetCartError({required this.message});
}

class UpdateCartProductQuantityLoading extends CartState {}

class UpdateCartProductQuantitySuccess extends CartState {}

class UpdateCartProductQuantityError extends CartState {
  String message;

  UpdateCartProductQuantityError({required this.message});
}

class DeleteProductFromCartLoading extends CartState {}

class DeleteProductFromCartSuccess extends CartState {}

class DeleteProductFromCartError extends CartState {
  String message;

  DeleteProductFromCartError({required this.message});
}
