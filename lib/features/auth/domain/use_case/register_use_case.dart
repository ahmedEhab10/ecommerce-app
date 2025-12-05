import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/Entities/User_Entitiy.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';

class RegisterUseCase {
  AuthRepositories authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<String, UserEntity>> call(RegisterRequest request) {
    return authRepository.register(request: request);
  }
}
