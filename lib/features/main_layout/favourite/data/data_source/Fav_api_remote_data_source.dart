import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/Models/get_fav_ressponse.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/Fav_remote_data_source.dart';

class FavAPiRemoteDataSource extends FavRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<void> addToFav(
      {required String productId, required String usertoken}) async {
    try {
      final response = await dio.post(ApiConstants.favEndPoint,
          data: {"productId": productId},
          options: Options(headers: {"token": usertoken}));
    } catch (e) {
      String? errorMessage;
      if (e is DioException) {
        errorMessage = e.response?.data['message'];
      }
      throw RemoteAppException(message: errorMessage ?? "Failed To Add To Fav");
    }
  }

  @override
  Future<get_fav_ressponse> getFavlist({required String usertoken}) async {
    try {
      final response = await dio.get(ApiConstants.favEndPoint,
          options: Options(headers: {"token": usertoken}));
      return get_fav_ressponse.fromJson(response.data);
    } catch (e) {
      String? errorMessage;
      if (e is DioException) {
        errorMessage = e.response?.data['message'];
      }
      throw RemoteAppException(
          message: errorMessage ?? "Failed To Get Fav List");
    }
  }

  @override
  Future<void> removeFromFav(
      {required String productId, required String usertoken}) async {
    try {
      final response = await dio.delete(
          '${ApiConstants.favEndPoint}/$productId',
          options: Options(headers: {"token": usertoken}));
    } catch (e) {
      String? errorMessage;
      if (e is DioException) {
        errorMessage = e.response?.data['message'];
      }
      throw RemoteAppException(message: errorMessage ?? "Failed To Remove Fav");
    }
  }
}
