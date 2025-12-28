import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/data_source/sub_catogories_api_remote_datasource.dart';
import 'package:ecommerce_app/features/main_layout/categories/Data/repositories_impl/sub_catogory_repo_impl.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/UseCases/get_sub_catogry_Usecase.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/Cubit/cubit/suc_catogory_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SucCatogoryCubit(
        getSubCatogryUsecase: GetSubCatogryUsecase(
          subCatogryRepo: SubCatogoryRepoImpl(
            subCatogoriesRemoteDataSource: SubCatogoriesApiRemoteDatasource(),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Row(
          children: [
            CategoriesList(),
            SizedBox(
              width: AppSize.s16,
            ),
            SubCategoriesList()
          ],
        ),
      ),
    );
  }
}
