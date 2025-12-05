import 'package:ecommerce_app/features/main_layout/home/data/Models/catogry_ressponse/catogry_ressponsed.dart';

abstract class CategoriesRemoteDataSource {
  Future<Catogry_ressponse> getCategories();
}
