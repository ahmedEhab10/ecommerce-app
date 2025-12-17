import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/cart/data/Models/CartResponse.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_remote_data_source.dart';

class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<void> addToCart(
      {required String productId, required String token}) async {
    try {
      final response = await dio.post(ApiConstants.cartEndPoint,
          data: {"productId": productId},
          options: Options(headers: {"token": token}));
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteAppException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> getCart({required String token}) async {
    try {
      final response = await dio.get(ApiConstants.cartEndPoint,
          options: Options(headers: {"token": token}));
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteAppException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> updateCartProductQuantity(
      {required String productId,
      required String quantity,
      required String token}) async {
    try {
      final response = await dio.put('${ApiConstants.cartEndPoint}/$productId',
          data: {"count": quantity},
          options: Options(headers: {"token": token}));
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteAppException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> deleteProductFromCart(
      {required String productId, required String token}) async {
    try {
      final response = await dio.delete(
          '${ApiConstants.cartEndPoint}/$productId',
          options: Options(headers: {"token": token}));
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteAppException(message: message ?? exception.toString());
    }
  }

  @override
  Future<void> clearCart({required String token}) async {
    try {
      await dio.delete(ApiConstants.cartEndPoint,
          options: Options(headers: {"token": token}));
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteAppException(message: message ?? exception.toString());
    }
  }
}
