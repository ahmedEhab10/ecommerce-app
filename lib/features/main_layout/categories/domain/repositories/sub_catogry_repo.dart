import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/Entities/sub_catogory_entity.dart';

abstract class SubCatogryRepo {
  Future<Either<String, List<SubCatogoryEntity>>> getSubCatogries(
      {required String catogoryId});
}
