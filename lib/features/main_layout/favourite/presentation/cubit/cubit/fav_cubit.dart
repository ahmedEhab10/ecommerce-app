import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/Entities/Fav_product_entity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecase/add_tofav_usecase.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecase/delet_fromfav_usecase.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecase/get_fav_list_usecase.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit({
    required this.getFavListUseCase,
    required this.addToFavUsecase,
    required this.deletFromfavUsecase,
  }) : super(FavInitial());

  final GetFavListUseCase getFavListUseCase;
  final AddTofavUsecase addToFavUsecase;
  final DeletFromfavUsecase deletFromfavUsecase;

  /// القائمة اللي الكيوبت ماسكها
  final List<FavProductEntity> _favProducts = [];

  List<FavProductEntity> get favProducts => List.unmodifiable(_favProducts);

  // ================= Get Fav List =================
  Future<void> getFavList() async {
    emit(GetFavListLoading());

    final result = await getFavListUseCase.call();

    result.fold(
      (errorMessage) {
        emit(GetFavListError(message: errorMessage));
      },
      (products) {
        _favProducts
          ..clear()
          ..addAll(products);

        emit(GetFavListSuccess(productList: favProducts));
      },
    );
  }

  // ================= Add To Fav =================
  Future<void> addToFav({
    required String productId,
    FavProductEntity? product, // اختياري لو عندك المنتج كامل
  }) async {
    emit(AddToFavtLoading());

    final result = await addToFavUsecase.call(productId: productId);

    result.fold(
      (errorMessage) {
        emit(AddToFavtError(message: errorMessage));
      },
      (_) {
        /// لو المنتج متبعت من الشاشة ضيفه مباشرة
        if (product != null && !_favProducts.any((p) => p.id == product.id)) {
          _favProducts.add(product);
        }

        emit(AddToFavtSuccess());
        emit(GetFavListSuccess(productList: favProducts));
      },
    );
  }

  // ================= Delete From Fav =================
  Future<void> deletFromFav({required String productId}) async {
    emit(DeleteProductFromFavLoading());

    final result = await deletFromfavUsecase.call(productId: productId);

    result.fold(
      (errorMessage) {
        emit(DeleteProductFromFavError(message: errorMessage));
      },
      (_) {
        _favProducts.removeWhere((p) => p.id == productId);

        emit(DeleteProductFromFavSuccess());
        emit(GetFavListSuccess(productList: favProducts));
      },
    );
  }

  // ================= Helpers =================
  bool isFav(String productId) {
    return _favProducts.any((p) => p.id == productId);
  }
}
