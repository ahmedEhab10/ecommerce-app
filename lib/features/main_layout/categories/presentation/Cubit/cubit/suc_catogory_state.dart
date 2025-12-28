part of 'suc_catogory_cubit.dart';

@immutable
sealed class SucCatogoryState {}

final class SucCatogoryInitial extends SucCatogoryState {}

final class SucCatogoryLoading extends SucCatogoryState {}

final class SucCatogorySuccess extends SucCatogoryState {
  final List<SubCatogoryEntity> subCatogoryEntityList;
  SucCatogorySuccess(this.subCatogoryEntityList);
}

final class SucCatogoryFailure extends SucCatogoryState {
  final String errorMessage;
  SucCatogoryFailure(this.errorMessage);
}
