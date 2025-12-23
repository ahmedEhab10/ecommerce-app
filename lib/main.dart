import 'package:ecommerce_app/core/routes_manager/route_generator.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/authapiremotdatasource.dart';
import 'package:ecommerce_app/features/auth/data/repositories_impl/auth_repositories_impl.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/login_cubit/login_cubit_cubit.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_api_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/data/repositories_impl/cart_repository_impl.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/delete_product_from_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/doamin/Usecase/update_cart_product_quantity_use_case.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            registerUseCase: RegisterUseCase(
              authRepository: AuthRepositoriesImpl(
                authRemoteDataSource: Authapiremotdatasource(),
                authLocalDataSource: AuthSharedPrefsLocalDataSource(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => LoginCubitCubit(
            loginUseCase: LoginUseCase(
              authRepository: AuthRepositoriesImpl(
                authRemoteDataSource: Authapiremotdatasource(),
                authLocalDataSource: AuthSharedPrefsLocalDataSource(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            addToCartUseCase: AddToCartUseCase(
              cartRepository: CartRepositoryImpl(
                remoteDataSource: CartApiRemoteDataSource(),
              ),
            ),
            getCartUseCase: GetCartUseCase(
              cartRepository: CartRepositoryImpl(
                remoteDataSource: CartApiRemoteDataSource(),
              ),
            ),
            updateCartProductQuantityUseCase: UpdateCartProductQuantityUseCase(
              cartRepository: CartRepositoryImpl(
                  remoteDataSource: CartApiRemoteDataSource()),
            ),
            deleteProductFromCartUseCase: DeleteProductFromCartUseCase(
              cartRepository: CartRepositoryImpl(
                remoteDataSource: CartApiRemoteDataSource(),
              ),
            ),
          ),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.signInRoute,
      ),
    );
  }
}
