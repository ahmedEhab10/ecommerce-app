import 'package:ecommerce_app/core/resources/assets_manager.dart';

import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/Models/catogry_item_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/Cubit/cubit/suc_catogory_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList({super.key});

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  void initState() {
    super.initState();

    final firstCategoryId = CatogryItemModel.listofcatogryItemModel.first.id;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SucCatogoryCubit>()
          .getSubCatogries(catogoryId: firstCategoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<SucCatogoryCubit, SucCatogoryState>(
        builder: (context, state) {
          if (state is SucCatogoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SucCatogoryFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is SucCatogorySuccess) {
            final subCategories = state.subCatogoryEntityList;

            return CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: subCategories.length,
                    (context, index) {
                      final item = subCategories[index];
                      return SubCategoryItem(
                        item.name!,
                        ImageAssets.subcategoryCardImage,
                        goToCategoryProductsListScreen,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: AppSize.s8,
                    crossAxisSpacing: AppSize.s8,
                  ),
                ),
              ],
            );
          }

          return const SizedBox(
            child: Text('a7aaa  '),
          );
        },
      ),
    );
  }
}

void goToCategoryProductsListScreen() {
  // todo implement this function
}
