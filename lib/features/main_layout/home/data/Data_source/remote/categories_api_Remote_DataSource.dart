import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Data_source/remote/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Models/catogry_ressponse/catogry_ressponsed.dart';

class CategoriesApiRemoteDatasource implements CategoriesRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<Catogry_ressponse> getCategories() async {
    try {
      final resspose = await dio.get(ApiConstants.category);
      return Catogry_ressponse.fromJson(resspose.data);
    } catch (e) {
      String? errormessage;
      if (e is DioException) {
        errormessage = e.response!.data['message'];
      }
      throw RemoteAppException(
          message: errormessage ?? "Failed To Get Categories");
    }
  }
}
