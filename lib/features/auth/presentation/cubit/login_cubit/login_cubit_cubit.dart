import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  AuthRepositories authRepositories;
  LoginCubitCubit({required this.authRepositories})
      : super(LoginCubitInitial());

  void login({required Login_request request}) async {
    emit(LoginLoading());
    var response = await authRepositories.login(request);
    response.fold((erremassage) {
      emit(LoginError(erremassage));
    }, (user) {
      emit(LoginSuccess());
    });
  }
}
