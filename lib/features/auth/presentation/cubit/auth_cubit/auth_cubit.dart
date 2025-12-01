import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepositories}) : super(AuthInitial());

  AuthRepositories authRepositories;
  void register({required RegisterRequest request}) async {
    emit(AuthLoading());
    var response = await authRepositories.register(request: request);
    response.fold((erremassage) {
      emit(AuthError(Erorrmessage: erremassage));
    }, (user) {
      emit(AuthSuccess());
    });
  }
}
