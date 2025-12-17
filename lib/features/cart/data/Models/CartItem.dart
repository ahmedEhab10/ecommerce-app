import 'package:ecommerce_app/features/cart/data/Models/Product.dart';
import 'package:ecommerce_app/features/cart/doamin/Entity/cart_item_entity.dart';

class CartItem {
  const CartItem({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  final int count;
  final String id;
  final Product product;
  final int price;

  factory CartItem.fromJson(dynamic json) {
    return CartItem(
        count: json['count'],
        id: json['_id'],
        product: Product.fromJson(json['product']),
        price: json['price']);
  }

  CartItemEntity toCartItemEntity() => CartItemEntity(
      count: count, id: id, product: product.toProductEntity(), price: price);
}
