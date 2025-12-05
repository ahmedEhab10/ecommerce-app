import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Entities/Brand_Entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Use_case/Brands_use_case.dart';
import 'package:meta/meta.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit({required this.brandsUseCase}) : super(BrandInitial());

  BrandsUseCase brandsUseCase;

  Future<void> getBrands() async {
    emit(BrandLoading());
    final result = await brandsUseCase.call();
    result.fold((error) => emit(BrandError(message: error)),
        (brands) => emit(BrandSuccess(brands: brands)));
  }
}
