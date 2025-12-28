import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/Models/get_sub_catogory_response.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/data_source/sub_catogories_remote_datasource.dart';

class SubCatogoriesApiRemoteDatasource extends SubCatogoriesRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<gat_sub_catogory_response> getSubCatogories(
      {required String catogoryId}) async {
    try {
      final resopnse = await dio.get(
          '${ApiConstants.category}/$catogoryId/${ApiConstants.subcategories}');
      return gat_sub_catogory_response.fromJson(resopnse.data);
    } catch (e) {
      String? errormessage;
      if (e is DioException) {
        errormessage = e.response!.data['message'];
      }
      throw RemoteAppException(message: errormessage ?? "Failed To Get Sub");
    }
  }
}
