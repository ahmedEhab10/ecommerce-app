import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/Models/catogry_item_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int index;

  final CatogryItemModel model;

  final bool isSelected;
  final Function(String catogoryid, int index) onItemClick;

  const CategoryItem(this.index, this.isSelected, this.onItemClick, this.model,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // Handle item click by calling onItemClick callback
    return InkWell(
      onTap: () => onItemClick(model.id, index),
      child: Container(
        // Set background color based on selection
        color: isSelected ? ColorManager.white : Colors.transparent,
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: AppSize.s8,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s100),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p16, horizontal: AppPadding.p8),
              child: Text(
                model.name,
                textAlign: TextAlign.start,
                style: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s14),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
//() => onItemClick(index)
