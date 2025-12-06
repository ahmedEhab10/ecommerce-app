import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/Use_case/Product_use_case.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productUseCase}) : super(ProductInitial());

  ProductUseCase productUseCase;

  Future<void> getProducts([String? categoryId]) async {
    emit(ProductLoading());
    final result = await productUseCase.call(categoryId);
    result.fold((failure) => emit(ProductError(message: failure)),
        (products) => emit(ProductSuccess(products: products)));
  }
}
