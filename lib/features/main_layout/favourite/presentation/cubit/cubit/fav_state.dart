part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

class AddToFavtLoading extends FavState {}

class AddToFavtSuccess extends FavState {}

class AddToFavtError extends FavState {
  String message;

  AddToFavtError({required this.message});
}

class GetFavListLoading extends FavState {}

class GetFavListSuccess extends FavState {
  List<FavProductEntity> productList;

  GetFavListSuccess({
    required this.productList,
  });
}

class GetFavListError extends FavState {
  String message;

  GetFavListError({required this.message});
}

class DeleteProductFromFavLoading extends FavState {}

class DeleteProductFromFavSuccess extends FavState {}

class DeleteProductFromFavError extends FavState {
  String message;

  DeleteProductFromFavError({required this.message});
}
