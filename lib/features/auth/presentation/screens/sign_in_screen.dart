import 'dart:developer';

import 'package:ecommerce_app/core/resources/UI_Utils.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/data/Models/Login_request.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/login_cubit/login_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Text(
                  'Welcome Back To Route',
                  style: getBoldStyle(color: ColorManager.white)
                      .copyWith(fontSize: FontSize.s24.sp),
                ),
                Text(
                  'Please sign in with your mail',
                  style: getLightStyle(color: ColorManager.white)
                      .copyWith(fontSize: FontSize.s16.sp),
                ),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                BuildTextField(
                  controller: emailController,
                  backgroundColor: ColorManager.white,
                  hint: 'enter your name',
                  label: 'User name',
                  textInputType: TextInputType.emailAddress,
                  validation: AppValidators.validateEmail,
                ),
                SizedBox(
                  height: AppSize.s28.h,
                ),
                BuildTextField(
                  controller: passwordController,
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'Password',
                  validation: AppValidators.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget password?',
                          style: getMediumStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s18.sp),
                        )),
                  ],
                ),
                SizedBox(
                  height: AppSize.s60.h,
                ),
                Center(
                  child: BlocListener<LoginCubitCubit, LoginCubitState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        log('state is AuthLoading');
                        UIUtils.showLoading(context, isDismissible: false);
                      } else if (state is LoginError) {
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(state.message, Colors.red);
                      } else if (state is LoginSuccess) {
                        log('state is AuthSuccess');
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(
                            "Successfully Registration", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, Routes.mainRoute);
                      }
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        isStadiumBorder: false,
                        label: 'Login',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s18),
                        onTap: () {
                          context.read<LoginCubitCubit>().login(
                                request: Login_request(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: getSemiBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(
                      width: AppSize.s8.w,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.signUpRoute),
                      child: Text(
                        'Create Account',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
