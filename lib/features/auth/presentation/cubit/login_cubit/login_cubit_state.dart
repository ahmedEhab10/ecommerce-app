part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginLoading extends LoginCubitState {}

final class LoginSuccess extends LoginCubitState {}

final class LoginError extends LoginCubitState {
  final String message;
  LoginError(this.message);
}
