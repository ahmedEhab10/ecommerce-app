import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginUseCase loginUseCase;
  LoginCubitCubit({required this.loginUseCase}) : super(LoginCubitInitial());

  void login({required Login_request request}) async {
    emit(LoginLoading());
    var response = await loginUseCase(request);
    response.fold((erremassage) {
      emit(LoginError(erremassage));
    }, (user) {
      emit(LoginSuccess());
    });
  }
}
