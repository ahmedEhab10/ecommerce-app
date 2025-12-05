import 'package:ecommerce_app/features/main_layout/home/data/Models/Brand_ressponse/Brand_ressponse.dart';

abstract class BrandsRemoteDataSource {
  Future<Brand_ressponse> getBrands();
}
