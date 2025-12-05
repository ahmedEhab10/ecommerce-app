part of 'brand_cubit.dart';

@immutable
sealed class BrandState {}

final class BrandInitial extends BrandState {}

final class BrandLoading extends BrandState {}

final class BrandSuccess extends BrandState {
  List<BrandEntity> brands;

  BrandSuccess({required this.brands});
}

final class BrandError extends BrandState {
  String message;

  BrandError({required this.message});
}
