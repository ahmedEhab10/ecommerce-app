import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/get_catogey_repo.dart';

class CategoriesUseCase {
  GetCatogeyRepo categoriesRepository;
  CategoriesUseCase({required this.categoriesRepository});
  Future<Either<String, List<CategoryEntity>>> call() {
    return categoriesRepository.getCategories();
  }
}
