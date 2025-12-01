import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_ressponse.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_resspons.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResspons> register(RegisterRequest request);

  Future<LoginRessponse> login(Login_request request);
}
