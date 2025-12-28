import 'package:ecommerce_app/features/main_layout/categories/Data/Models/get_sub_catogory_response.dart';

abstract class SubCatogoriesRemoteDataSource {
  Future<gat_sub_catogory_response> getSubCatogories(
      {required String catogoryId});
}
