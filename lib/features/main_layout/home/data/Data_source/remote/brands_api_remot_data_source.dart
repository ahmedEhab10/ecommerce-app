import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Data_source/remote/brands_remote_data_sources.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Models/Brand_ressponse/Brand_ressponse.dart';

class BrandsApiRemotDataSource implements BrandsRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<Brand_ressponse> getBrands() async {
    try {
      final response = await dio.get(ApiConstants.brands);
      return Brand_ressponse.fromJson(response.data);
    } catch (e) {
      String? errormessage;
      if (e is DioException) {
        errormessage = e.response!.data['message'];
      }
      throw RemoteAppException(message: errormessage ?? "Failed To Get Brands");
    }
  }
}
