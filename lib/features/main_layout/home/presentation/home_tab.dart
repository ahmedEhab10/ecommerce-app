import 'dart:async';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Data_source/remote/brands_api_remot_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Data_source/remote/categories_api_Remote_DataSource.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/get_brands_repo_impl.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/get_catogry_repo_impl.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Use_case/Brands_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/Use_case/categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/cubit/brand_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/cubit/catogry_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CatogryCubit(
                  categoriesUseCase: CategoriesUseCase(
                    categoriesRepository: GetCatogryRepoImpl(
                      categoriesRemoteDataSource:
                          CategoriesApiRemoteDatasource(),
                    ),
                  ),
                )..getCategories()),
        BlocProvider(
          create: (context) => BrandCubit(
            brandsUseCase: BrandsUseCase(
              getBrandsRepo: GetBrandsRepoImpl(
                brandsRemoteDataSource: BrandsApiRemotDataSource(),
              ),
            ),
          )..getBrands(),
        )
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                BlocBuilder<CatogryCubit, CatogryState>(
                  builder: (context, state) {
                    if (state is CatogryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CatogryError) {
                      return Center(child: Text(state.erorMassage!));
                    }
                    if (state is CatogrySuccess) {
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              categoryEntity: state.categories[index],
                            );
                          },
                          itemCount: state.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    }
                    return Container(
                      height: 90,
                      width: 90,
                      color: Colors.red,
                    );
                  },
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                BlocBuilder<BrandCubit, BrandState>(
                  builder: (context, state) {
                    if (state is BrandLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is BrandError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is BrandSuccess) {
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomBrandWidget(
                              brandEntity: state.brands[index],
                            );
                          },
                          itemCount: state.brands.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                // CustomSectionBar(
                //   sectionNname: 'Most Selling Products',
                //   function: () {},
                // ),
                // SizedBox(
                //   child: SizedBox(
                //     height: 360.h,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const ProductCard(
                //           title: "Nike Air Jordon",
                //           description:
                //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                //           rating: 4.5,
                //           price: 1100,
                //           priceBeforeDiscound: 1500,
                //           image: ImageAssets.categoryHomeImage,
                //         );
                //       },
                //       itemCount: 20,
                //     ),
                //   ),
                // ),
                SizedBox(height: 12.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
