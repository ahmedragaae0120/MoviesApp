import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/Presentation/layouts/register/register_viewmodel/register_view_model.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/custom_text_filed.dart';
import 'package:movies_app/data/models/user_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formfkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return BlocListener<RegisterViewModel, RegisterState>(
      listenWhen: (previous, current) {
        if (current is RegisteSuccessState ||
            current is RegisterErrorState ||
            current is RegisterLoadingState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is RegisteSuccessState) {
          Navigator.pop(context);
          FireStoreHelper.addUser(
              userId: state.usercredential.user!.uid,
              email: emailController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text);

          authProvider.setUsers(
              state.usercredential.user,
              UserModel(
                  email: emailController.text,
                  userid: state.usercredential.user!.uid,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text));
          authProvider.retrieveDatabaseUserData();
          Future.delayed(
            const Duration(seconds: 1),
            () =>
                Navigator.pushReplacementNamed(context, Routes.loginRouteName),
          );
        }
        if (state is RegisterErrorState) {
          Navigator.pop(context);
          Future.delayed(
            const Duration(seconds: 1),
            () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.errorMessage),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("try again"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 26.w),
          child: Form(
            key: formfkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create New Account",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 36.h),
                Text(
                  "please fill in the form to continue",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 73.h),
                CustomTextFiled(
                  hintText: 'First Name',
                  textController: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "this field can't be empty";
                    }
                    return null;
                  },
                  keyboard: TextInputType.name,
                ),
                SizedBox(height: 59.h),
                CustomTextFiled(
                  hintText: 'Last Name',
                  textController: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "this field can't be empty";
                    }
                    return null;
                  },
                  keyboard: TextInputType.name,
                ),
                SizedBox(height: 59.h),
                CustomTextFiled(
                  hintText: 'Email',
                  textController: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "this field can't be empty";
                    }
                    if (!RegExp(Constants.RegExValidateEmail).hasMatch(value)) {
                      return "Enter valid Email";
                    }
                    return null;
                  },
                  keyboard: TextInputType.emailAddress,
                ),
                SizedBox(height: 59.h),
                CustomTextFiled(
                  hintText: 'Password',
                  textController: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "this field can't be empty";
                    }
                    if (value.length < 8) {
                      return "password must be more than 8 char ";
                    }
                    return null;
                  },
                  obscureText: authProvider.isShowPasswordRegister,
                  suffixIcon: IconButton(
                    onPressed: () {
                      authProvider.changeIsShowPasswordRegister(
                          authProvider.isShowPasswordRegister == false
                              ? true
                              : false);
                    },
                    icon: Icon(authProvider.isShowPasswordRegister
                        ? Icons.visibility_off
                        : Icons.visibility,color: Colors.white,),
                  ),
                  keyboard: TextInputType.visiblePassword,
                ),
                SizedBox(height: 89.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formfkey.currentState?.validate() ?? false) {
                       
                        RegisterViewModel regViewModel =
                            RegisterViewModel.get(context);
                        regViewModel.register(
                            emailController.text, passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: Size(280.w, 49.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "register",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginRouteName, (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
