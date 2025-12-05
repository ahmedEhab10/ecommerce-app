import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/category_entity.dart';

abstract class GetCatogeyRepo {
  Future<Either<String, List<CategoryEntity>>> getCategories();
}
