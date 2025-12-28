import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/data_source/sub_catogories_remote_datasource.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/Entities/sub_catogory_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/sub_catogry_repo.dart';

class SubCatogoryRepoImpl implements SubCatogryRepo {
  SubCatogoriesRemoteDataSource subCatogoriesRemoteDataSource;

  SubCatogoryRepoImpl({required this.subCatogoriesRemoteDataSource});
  @override
  Future<Either<String, List<SubCatogoryEntity>>> getSubCatogries(
      {required String catogoryId}) async {
    try {
      final result = await subCatogoriesRemoteDataSource.getSubCatogories(
          catogoryId: catogoryId);
      return Right(result.data!.map((e) => e.toEntity()).toList());
    } on RemoteAppException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
