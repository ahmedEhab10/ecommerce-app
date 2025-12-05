import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase}) : super(AuthInitial());

  RegisterUseCase registerUseCase;
  void register({required RegisterRequest request}) async {
    emit(AuthLoading());
    var response = await registerUseCase.call(request);
    response.fold((erremassage) {
      emit(AuthError(Erorrmessage: erremassage));
    }, (user) {
      emit(AuthSuccess());
    });
  }
}
