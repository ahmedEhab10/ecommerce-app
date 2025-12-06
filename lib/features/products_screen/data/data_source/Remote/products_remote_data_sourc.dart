import 'package:ecommerce_app/features/products_screen/data/Models/Product_ressponse.dart';

abstract class ProductsRemoteDataSource {
  Future<Product_ressponse> getProducts([String? categoryId]);
}
