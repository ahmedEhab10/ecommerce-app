import 'package:colornames/colornames.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/Entities/Fav_product_entity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/custom_txt_widget.dart';
import 'package:ecommerce_app/features/products_screen/domain/Entities/Product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteItemDetails extends StatelessWidget {
  FavouriteItemDetails(
      {required this.product, super.key, required this.favProductEntity});

  final Map<String, dynamic> product;
  FavProductEntity favProductEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: favProductEntity.title!,
          textStyle: getSemiBoldStyle(
              color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${favProductEntity.price} ',
              textStyle: getSemiBoldStyle(
                      color: ColorManager.primaryDark, fontSize: AppSize.s18.sp)
                  .copyWith(
                letterSpacing: 0.17,
              ),
            ),
            // product["salePrice"] == null
            //     ? const SizedBox.shrink()
            //     : Flexible(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             SizedBox(
            //               height: AppSize.s10.h,
            //             ),
            //             CustomTextWgt(
            //                 data: 'EGP ${product["salePrice"]}',
            //                 textStyle: getMediumStyle(
            //                         color: ColorManager.appBarTitleColor
            //                             .withOpacity(.6))
            //                     .copyWith(
            //                         letterSpacing: 0.17,
            //                         decoration: TextDecoration.lineThrough,
            //                         color: ColorManager.appBarTitleColor
            //                             .withOpacity(.6),
            //                         fontSize: AppSize.s10.sp)),
            //           ],
            //         ),
            //       ),
          ],
        ),
      ],
    );
  }
}
