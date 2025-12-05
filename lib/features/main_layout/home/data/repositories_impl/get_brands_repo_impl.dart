import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Data_source/remote/brands_remote_data_sources.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/Brand_Entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/get_brands_repo.dart';

class GetBrandsRepoImpl implements GetBrandsRepo {
  BrandsRemoteDataSource brandsRemoteDataSource;

  GetBrandsRepoImpl({required this.brandsRemoteDataSource});
  @override
  Future<Either<String, List<BrandEntity>>> getBrands() async {
    try {
      final result = await brandsRemoteDataSource.getBrands();
      return Right(
          result.brands!.map((brand) => brand.toBrandEntity()).toList());
    } on RemoteAppException catch (exception) {
      return Left(exception.message);
    }
  }
}
