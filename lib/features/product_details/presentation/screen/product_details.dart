import 'package:ecommerce_app/core/resources/UI_Utils.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';

import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productCounter = 1;
  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProductSlider(
              initialIndex: 0,
              imagesurl: widget.productEntity.images,
            ),
            SizedBox(
              height: 24.h,
            ),
            ProductLabel(
                productName: widget.productEntity.title,
                productPrice: '${widget.productEntity.price} EGP'),
            SizedBox(
              height: 16.h,
            ),
            ProductRating(
              productBuyers: '${widget.productEntity.sold}',
              productRating: '${widget.productEntity.ratingsAverage} (7,500)',
              add: (i) {
                setState(() {
                  if (productCounter < 10) productCounter++;
                });
              },
              remove: (int p1) {
                setState(() {
                  if (productCounter > 1) {
                    productCounter--;
                  } else {
                    productCounter = 1;
                  }
                });
              },
              productCounter: productCounter,
            ),
            SizedBox(
              height: 16.h,
            ),
            ProductDescription(
                productDescription: widget.productEntity.description),
            ProductSize(
              size: const [35, 38, 39, 40],
              onSelected: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('Color',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 18.sp)),
            ProductColor(color: const [
              Colors.red,
              Colors.blueAccent,
              Colors.green,
              Colors.yellow,
            ], onSelected: () {}),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('${widget.productEntity.price * productCounter} EGP',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: BlocListener<CartCubit, CartState>(
                    listener: (context, state) {
                      if (state is AddToCartLoading) {
                        UIUtils.showLoading(context);
                      } else if (state is AddToCartError) {
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(state.message, Colors.red);
                      } else if (state is AddToCartSuccess) {
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage("Product Added", Colors.green);
                      }
                    },
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {
                        cartCubit.addToCart(productId: widget.productEntity.id);
                      },
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
