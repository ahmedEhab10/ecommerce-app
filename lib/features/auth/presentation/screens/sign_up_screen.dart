import 'dart:developer';

import 'package:ecommerce_app/core/resources/UI_Utils.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/data/Models/register_request.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController fullNameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                BuildTextField(
                  controller: fullNameController,
                  backgroundColor: ColorManager.white,
                  hint: 'enter your full name',
                  label: 'Full Name',
                  textInputType: TextInputType.name,
                  validation: AppValidators.validateFullName,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  controller: mobileController,
                  hint: 'enter your mobile no.',
                  backgroundColor: ColorManager.white,
                  label: 'Mobile Number',
                  validation: AppValidators.validatePhoneNumber,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  controller: emailController,
                  hint: 'enter your email address',
                  backgroundColor: ColorManager.white,
                  label: 'E-mail address',
                  validation: AppValidators.validateEmail,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  controller: passwordController,
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'password',
                  validation: AppValidators.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                Center(
                  child: BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        log('state is AuthLoading');
                        UIUtils.showLoading(context, isDismissible: false);
                      } else if (state is AuthError) {
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(
                            state.Erorrmessage, Colors.red);
                      } else if (state is AuthSuccess) {
                        log('state is AuthSuccess');
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(
                            "Successfully Registration", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, Routes.signInRoute);
                      }
                    },
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery.of(context).size.width * .9,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        label: 'Sign Up',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s20),
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).register(
                              request: RegisterRequest(
                                  name: fullNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  rePassword: passwordController.text,
                                  phone: mobileController.text));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
