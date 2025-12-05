import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/Brand_Entity.dart';

abstract class GetBrandsRepo {
  Future<Either<String, List<BrandEntity>>> getBrands();
}
