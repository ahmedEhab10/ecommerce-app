import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_ressponse.dart';
import 'package:ecommerce_app/features/auth/data/Models/User.dart';

import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_resspons.dart';

abstract class AuthRepositories {
  Future<Either<String, User>> register({required RegisterRequest request});
  Future<Either<String, User>> login(Login_request request);
}
