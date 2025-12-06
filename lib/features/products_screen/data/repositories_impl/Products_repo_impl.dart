import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/features/products_screen/data/Models/Product_ressponse.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/Remote/products_remote_data_sourc.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/Product_repo.dart';

class ProductsRepoImpl implements ProductRepo {
  ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepoImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<String, List<ProductEntity>>> getProducts(
      [String? categoryId]) async {
    try {
      final response = await productsRemoteDataSource.getProducts(categoryId);
      return Right(response.products!
          .map((product) => product.toproductEntity())
          .toList());
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }
}
