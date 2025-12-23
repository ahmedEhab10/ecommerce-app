import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_entity.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/delete_product_from_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/update_cart_product_quantity_use_case.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
      {required this.addToCartUseCase,
      required this.getCartUseCase,
      required this.updateCartProductQuantityUseCase,
      required this.deleteProductFromCartUseCase})
      : super(CartInitial());

  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  UpdateCartProductQuantityUseCase updateCartProductQuantityUseCase;
  DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  late CartEntity cart;

  Future<void> addToCart({required String productId}) async {
    emit(AddToCartLoading());
    var result = await addToCartUseCase(productId: productId);
    result.fold(
        (failureMassage) => emit(AddToCartError(message: failureMassage)),
        (_) => emit(AddToCartSuccess()));
  }

  void getCart() async {
    emit(GetCartLoading());
    var result = await getCartUseCase();
    result.fold((failureMassage) {
      emit(GetCartError(message: failureMassage));
    }, (cart) {
      this.cart = cart;
      emit(GetCartSuccess());
    });
  }

  void updateCartProduct(
      {required String productId, required String quantity}) async {
    emit(UpdateCartProductQuantityLoading());
    var result = await updateCartProductQuantityUseCase(
        productId: productId, quantity: quantity);
    result.fold((failureMassage) {
      emit(UpdateCartProductQuantityError(message: failureMassage));
    }, (cart) {
      this.cart = cart;
      emit(UpdateCartProductQuantitySuccess());
    });
  }

  void deleteProductFromCart({required String productId}) async {
    emit(DeleteProductFromCartLoading());
    var result = await deleteProductFromCartUseCase(productId: productId);
    result.fold((failureMassage) {
      emit(DeleteProductFromCartError(message: failureMassage));
    }, (cart) {
      this.cart = cart;
      emit(DeleteProductFromCartSuccess());
    });
  }
}
