part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductError extends ProductState {
  String message;
  ProductError({required this.message});
}

final class ProductSuccess extends ProductState {
  List<ProductEntity> products;
  ProductSuccess({required this.products});
}
