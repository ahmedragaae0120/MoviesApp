
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/login/login_Viewmodel/login_view_model.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/custom_text_filed.dart';
import 'package:movies_app/data/models/user_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formfkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context);
    return BlocListener<loginViewModel, loginState>(
      listenWhen: (previous, current) {
        if (current is loginSuccessState ||
            current is loginErrorState ||
            current is loginLoadingState) {
          return true;
        }
        return false;
      },
      listener: (context, state) async {
        if (state is loginSuccessState) {
          Navigator.pop(context);
          UserModel? user = await FireStoreHelper.getUser(
              userId: state.usercredential.user!.uid);
          provider.setUsers(state.usercredential.user, user);

          provider.retrieveDatabaseUserData();

          Future.delayed(
            const Duration(seconds: 1),
            () => Navigator.pushReplacementNamed(context, Routes.homeRouteName),
          );
        }
        if (state is loginErrorState) {
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
                  "Welcome Back",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 22.h),
                Text(
                  "Enjoy your watch",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 104.h),
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
                SizedBox(height: 98.h),
                CustomTextFiled(
                  hintText: 'Password',
                  textController: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "this field can't be empty";
                    }
                    if (value.length < 8) {
                      return "password must less than 8 char ";
                    }
                    return null;
                  },
                  obscureText: provider.isShowPasswordLogin,
                  suffixIcon: IconButton(
                      onPressed: () {
                        // isObscure = !isObscure;
                        provider.changeIsShowPassworLogin(
                            provider.isShowPasswordLogin == false ? true : false);
                      },
                      icon: Icon(provider.isShowPasswordLogin
                        ? Icons.visibility_off
                        : Icons.visibility,color: Colors.white,),),
                  keyboard: TextInputType.text,
                ),
                SizedBox(height: 158.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formfkey.currentState?.validate() ?? false) {
                        loginViewModel login = loginViewModel.get(context);
                        login.login(emailController.text,
                            passwordController.text, context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: Size(280.w, 49.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: 58.h),
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
                        Navigator.of(context)
                            .pushNamed(Routes.registerRouteName);
                      },
                      child: Text(
                        "register",
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
