import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/shared/design/app_button.dart';
import 'package:thimar_app/shared/design/app_input.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/forget_password/view.dart';
import 'package:thimar_app/view/auth/login/bloc.dart';
import 'package:thimar_app/view/auth/login/states.dart';
import 'package:thimar_app/view/auth/register/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
              child: ListView(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 126,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "مرحبا بك مرة أخرى",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "يمكنك تسجيل الدخول الأن",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    AppInput(
                      labelText: "رقم الجوال",
                      controller: cubit.phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "رقم الهاتف مطلوب";
                        } else if (value.length < 11) {
                          return "يجب ان يكون رقم الهاتف مكون من 11 رقم";
                        } else {
                          return null;
                        }
                      },
                      icon: "assets/icons/phone.png",
                      isPhone: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppInput(
                      labelText: "كلمة المرور",
                      controller: cubit.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "كلمه المرور مطلوبه";
                        } else if (value.length < 9) {
                          return "يجب ان تكون كلمه المرور مكونه من 9 ارقام";
                        } else {
                          return null;
                        }
                      },
                      icon: "assets/icons/password.png",
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  toGetNavigate(
                    const ForgetPasswordView(),
                  );
                },
                child: const Text(
                  textAlign: TextAlign.end,
                  "نسيت كلمة المرور ؟",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              BlocBuilder<LoginCubit, LoginStates>(
                builder: (context, state) {
                  if (state is GetIsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return AppButton(
                      text: "تسجيل الدخول",
                      onPress: () {
                        cubit.login();
                      },
                    );
                  }
                },
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ليس لديك حساب ؟",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      toGetNavigate(
                        const RegisterView(),
                      );
                    },
                    child: const Text(
                      "تسجيل الأن",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
        );
      },
      ),
    );
  }
}
