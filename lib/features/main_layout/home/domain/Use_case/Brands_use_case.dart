import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/Brand_Entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/get_brands_repo.dart';

class BrandsUseCase {
  GetBrandsRepo getBrandsRepo;
  BrandsUseCase({required this.getBrandsRepo});

  Future<Either<String, List<BrandEntity>>> call() {
    return getBrandsRepo.getBrands();
  }
}
