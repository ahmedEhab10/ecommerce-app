import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/Entities/sub_catogory_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/sub_catogry_repo.dart';

class GetSubCatogryUsecase {
  SubCatogryRepo subCatogryRepo;

  GetSubCatogryUsecase({required this.subCatogryRepo});
  Future<Either<String, List<SubCatogoryEntity>>> call(
      {required String catogoryId}) async {
    return await subCatogryRepo.getSubCatogries(catogoryId: catogoryId);
  }
}
