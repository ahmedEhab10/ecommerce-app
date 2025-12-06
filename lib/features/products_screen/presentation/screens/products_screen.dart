import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/Remote/Products_remote_api_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/repositories_impl/Products_repo_impl.dart';
import 'package:ecommerce_app/features/products_screen/domain/Use_case/Product_use_case.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, this.categoryId});
  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocProvider(
          create: (context) => ProductCubit(
            productUseCase: ProductUseCase(
              productRepo: ProductsRepoImpl(
                productsRemoteDataSource: ProductsRemoteApiDataSource(),
              ),
            ),
          )..getProducts(categoryId),
          child: Column(
            children: [
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is ProductSuccess) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            product: state.products[index],
                            image: ImageAssets.categoryHomeImage,
                            title: "Nike Air Jordon",
                            price: 1100,
                            rating: 4.7,
                            discountPercentage: 10,
                            height: height,
                            width: width,
                            description:
                                "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    );
                  }
                  return Container(
                    width: 30,
                    height: 40,
                    color: Colors.red,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
