import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/cubit/fav_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavCubit cubit = BlocProvider.of<FavCubit>(context);
  @override
  void initState() {
    cubit.getFavList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
        child: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (state is GetFavListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetFavListError) {
              return Center(child: Text(state.message));
            } else if (state is GetFavListSuccess) {
              return ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child: FavoriteItem(
                      product: AppConstants.favoriteProducts[index],
                      favProductEntity: state.productList[index],
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
