import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/Models/catogry_item_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/Cubit/cubit/suc_catogory_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  // final Function(String catogoryid) onItemClick;

  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;
  String selectedCatogryId = 'aggfafaefa';

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: ColorManager.containerGray,
        border: Border(
            // set the border for only 3 sides
            top: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3)),
            left: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3)),
            bottom: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3))),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
      ),

      // the categories items list
      child: ClipRRect(
        // clip the corners of the container that hold the list view
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
        child: ListView.builder(
          itemCount: CatogryItemModel.listofcatogryItemModel.length,
          itemBuilder: (context, index) => CategoryItem(
              index,
              selectedIndex == index,
              onItemClick,
              CatogryItemModel.listofcatogryItemModel[index]),
        ),
      ),
    ));
  }

  // callback function to change the selected index
  void onItemClick(String catogryId, int index) {
    print("catogryId: $catogryId");
    setState(() {
      selectedIndex = index;
      selectedCatogryId = catogryId;
    });
    context.read<SucCatogoryCubit>().getSubCatogries(catogoryId: catogryId);
  }
}
