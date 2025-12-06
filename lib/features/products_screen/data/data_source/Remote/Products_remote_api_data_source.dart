import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/Models/Product_ressponse.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/Remote/products_remote_data_sourc.dart';

class ProductsRemoteApiDataSource implements ProductsRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<Product_ressponse> getProducts([String? categoryId]) async {
    try {
      final response = await dio.get(ApiConstants.products,
          queryParameters: categoryId != null
              ? {
                  "category": categoryId,
                }
              : null);
      return Product_ressponse.fromJson(response.data);
    } catch (e) {
      print("ERROR ==> $e");

      if (e is DioException) {
        print("STATUS CODE ==> ${e.response?.statusCode}");
        print("RESPONSE DATA ==> ${e.response?.data}");
      }

      throw RemoteAppException(
        message: "Failed To Get Products",
      );
    }
  }
}
