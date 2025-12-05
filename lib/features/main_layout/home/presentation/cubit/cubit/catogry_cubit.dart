import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Use_case/categories_use_case.dart';
import 'package:meta/meta.dart';

part 'catogry_state.dart';

class CatogryCubit extends Cubit<CatogryState> {
  CatogryCubit({required this.categoriesUseCase}) : super(CatogryInitial());
  CategoriesUseCase categoriesUseCase;

  Future<void> getCategories() async {
    emit(CatogryLoading());
    var result = await categoriesUseCase.call();
    result.fold((error) => emit(CatogryError(erorMassage: error)),
        (catogries) => emit(CatogrySuccess(categories: catogries)));
  }
}
