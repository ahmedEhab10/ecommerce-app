import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Data_source/remote/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/get_catogey_repo.dart';

class GetCatogryRepoImpl implements GetCatogeyRepo {
  CategoriesRemoteDataSource categoriesRemoteDataSource;

  GetCatogryRepoImpl({required this.categoriesRemoteDataSource});

  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await categoriesRemoteDataSource.getCategories();
      return Right(
          response.catories!.map((catogry) => catogry.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
