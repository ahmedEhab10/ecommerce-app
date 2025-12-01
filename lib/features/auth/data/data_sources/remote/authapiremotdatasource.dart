import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_ressponse.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_resspons.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/authremotedatasource.dart';

class Authapiremotdatasource extends AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<RegisterResspons> register(RegisterRequest request) async {
    try {
      final response =
          await dio.post(ApiConstants.register, data: request.toJson());
      return RegisterResspons.fromJson(response.data);
    } catch (exception) {
      String? errormessage;
      if (exception is DioException) {
        errormessage = exception.response!.data['message'];
      }
      throw RemoteAppException(message: errormessage ?? "Failed To Register");
    }
  }

  @override
  Future<LoginRessponse> login(Login_request request) async {
    try {
      final response =
          await dio.post(ApiConstants.login, data: request.toJson());
      return LoginRessponse.fromJson(response.data);
    } catch (exception) {
      String? errormessage;
      if (exception is DioException) {
        errormessage = exception.response!.data['message'];
      }
      throw RemoteAppException(message: errormessage ?? "Failed To Login");
    }
  }
}
