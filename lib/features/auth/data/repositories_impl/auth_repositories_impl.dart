import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_ressponse.dart';
import 'package:ecommerce_app/features/auth/data/Models/User.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_resspons.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/authremotedatasource.dart';
import 'package:ecommerce_app/features/auth/domain/Entities/User_Entitiy.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  AuthRepositoriesImpl(
      {required this.authRemoteDataSource, required this.authLocalDataSource});
  AuthRemoteDataSource authRemoteDataSource; // = AuthapiRemoteDataSource();
  AuthLocalDataSource authLocalDataSource;

  @override
  Future<Either<String, UserEntity>> register(
      {required RegisterRequest request}) async {
    try {
      final response = await authRemoteDataSource.register(request);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user.toEntity());
    } on AppException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, UserEntity>> login(Login_request request) async {
    try {
      final response = await authRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.user.toEntity());
    } on AppException catch (e) {
      return Left(e.toString());
    }
  }
}
