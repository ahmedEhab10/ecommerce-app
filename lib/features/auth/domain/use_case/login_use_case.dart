import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/domain/Entities/User_Entitiy.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';

class LoginUseCase {
  AuthRepositories authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<String, UserEntity>> call(Login_request request) {
    return authRepository.login(request);
  }
}
