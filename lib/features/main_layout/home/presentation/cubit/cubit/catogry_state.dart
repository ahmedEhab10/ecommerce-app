part of 'catogry_cubit.dart';

@immutable
sealed class CatogryState {}

final class CatogryInitial extends CatogryState {}

final class CatogryLoading extends CatogryState {}

final class CatogryError extends CatogryState {
  String? erorMassage;
  CatogryError({this.erorMassage});
}

final class CatogrySuccess extends CatogryState {
  List<CategoryEntity> categories;
  CatogrySuccess({required this.categories});
}
