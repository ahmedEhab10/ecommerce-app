import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/Entities/sub_catogory_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/UseCases/get_sub_catogry_Usecase.dart';
import 'package:meta/meta.dart';

part 'suc_catogory_state.dart';

class SucCatogoryCubit extends Cubit<SucCatogoryState> {
  GetSubCatogryUsecase getSubCatogryUsecase;
  SucCatogoryCubit({required this.getSubCatogryUsecase})
      : super(SucCatogoryInitial());

  Future<void> getSubCatogries({required String catogoryId}) async {
    emit(SucCatogoryLoading());
    final result = await getSubCatogryUsecase.call(catogoryId: catogoryId);
    result.fold((failure) {
      emit(SucCatogoryFailure(failure));
    }, (subCatogries) {
      emit(SucCatogorySuccess(subCatogries));
    });
  }
}
