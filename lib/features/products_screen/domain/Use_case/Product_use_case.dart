import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/Product_repo.dart';

class ProductUseCase {
  ProductRepo productRepo;
  ProductUseCase({required this.productRepo});

  Future<Either<String, List<ProductEntity>>> call([String? categoryId]) async {
    return await productRepo.getProducts(categoryId);
  }
}
