import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_ressponse.dart';
import 'package:ecommerce_app/features/auth/data/Models/User.dart';

import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_resspons.dart';
import 'package:ecommerce_app/features/auth/domain/Entities/User_Entitiy.dart';

abstract class AuthRepositories {
  Future<Either<String, UserEntity>> register(
      {required RegisterRequest request});
  Future<Either<String, UserEntity>> login(Login_request request);
}
