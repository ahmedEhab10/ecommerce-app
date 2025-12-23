import 'package:ecommerce_app/core/resources/UI_Utils.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartCubit cartCubit = BlocProvider.of<CartCubit>(context);

  @override
  void initState() {
    cartCubit.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is UpdateCartProductQuantityLoading ||
                state is DeleteProductFromCartLoading) {
              UIUtils.showLoading(context);
            } else if (state is UpdateCartProductQuantitySuccess ||
                state is DeleteProductFromCartSuccess) {
              UIUtils.hideDialog(context);
              UIUtils.showToastMessage("Success", Colors.green);
            } else if (state is UpdateCartProductQuantityError) {
              UIUtils.hideDialog(context);
              UIUtils.showToastMessage(state.message, Colors.red);
            } else if (state is DeleteProductFromCartError) {
              UIUtils.hideDialog(context);
              UIUtils.showToastMessage(state.message, Colors.red);
            }
          },
          builder: (context, state) {
            if (state is GetCartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetCartError) {
              return Center(
                child: Text(state.message),
              );
            }
            return cartCubit.cart.cartItems.isEmpty
                ? Center(
                    child: Text("Cart is Empty"),
                  )
                : Column(
                    children: [
                      Expanded(
                        // the list of cart items ===============
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            cartItemEntity: cartCubit.cart.cartItems[index],
                            onDeleteTap: () {},
                            size: 40,
                            color: Colors.black,
                            colorName: 'Black',
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount: cartCubit.cart.cartItems.length,
                        ),
                      ),
                      // the total price and checkout button========
                      TotalPriceAndCheckoutBotton(
                        totalPrice: cartCubit.cart.totalCartPrice,
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
