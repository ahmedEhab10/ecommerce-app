import 'package:ecommerce_app/features/cart/doamin/Entity/product_entity.dart';

class CartItemEntity {
  const CartItemEntity({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  final int count;
  final String id;
  final ProductEntityy product;
  final int price;
}
