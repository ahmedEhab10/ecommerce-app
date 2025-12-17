import 'package:ecommerce_app/features/cart/data/Models/Cart.dart';

class CartResponse {
  final String status;
  final int numOfCartItems;
  final Cart cart;
  final String? cartId;

  const CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cart,
  });

  factory CartResponse.fromJson(dynamic json) {
    return CartResponse(
        status: json['status'],
        numOfCartItems: json['numOfCartItems'],
        cartId: json['cartId'],
        cart: Cart.fromJson(json['data']));
  }
}
