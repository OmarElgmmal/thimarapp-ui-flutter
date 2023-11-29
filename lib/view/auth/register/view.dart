import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/shared/design/app_button.dart';
import 'package:thimar_app/shared/design/app_input.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/login/view.dart';
import 'package:thimar_app/view/auth/register/bloc.dart';
import 'package:thimar_app/view/auth/register/custom_city.dart';
import 'package:thimar_app/view/auth/register/states.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: Builder(
    builder: (context) {
      RegisterCubit cubit = BlocProvider.of(context);
      return Scaffold(
          body: SafeArea(
              child: Form(
            key: cubit.formKey,
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
                  "يمكنك تسجيل حساب جديد الأن",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                AppInput(
                  labelText: "اسم المستخدم",
                  controller: cubit.fullnameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "اسم المستخدم مطلوب";
                    } else {
                      return null;
                    }
                  },
                  icon: "assets/icons/user.png",
                ),
                const SizedBox(
                  height: 16,
                ),
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
                StatefulBuilder(
                  builder: (context, setState) => GestureDetector(
                      onTap: () async {
                        var result = await showModalBottomSheet(
                            context: context,
                            builder: (context) => const CitiesSheet());
                        if (result != null) {
                          cubit.selectedCity = result;
                        }
                        print(
                          "The Result Is${cubit.selectedCity!.name}",
                        );
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: AppInput(
                                labelText: cubit.selectedCity?.name ?? "المدينة",
                                validator: (value) {
                                  if (cubit.selectedCity == null) {
                                    return " المدينه مطلوبه";
                                  } else {
                                    return null;
                                  }
                                },
                                icon: "assets/icons/city.png",
                              ),
                            ),
                          ),
                          if (cubit.selectedCity != null)
                            Center(
                              child: IconButton(
                                onPressed: () {
                                  cubit.selectedCity = null;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                        ],
                      )),
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
                const SizedBox(
                  height: 16,
                ),
                AppInput(
                  labelText: "كلمة المرور",
                  controller: cubit.confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "تاكيد كلمه المرور مطلوبه";
                    }else if(value != cubit.passwordController.text)
                    {
                      return "كلمتا المرور غير متطابقتين";
                    }else {
                      return null;
                    }
                  },
                  icon: "assets/icons/password.png",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                BlocBuilder<RegisterCubit,RegisterStates>(builder: (context, state) {
                  if(state is RegisterIsLoadingState)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return AppButton(
                      text: "تسجيل الدخول",
                      onPress: () {
                        cubit.register();
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
                      " لديك حساب ؟",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        toGetNavigate(
                          const LoginView(),
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
          ),
        );
    }
  ),
);
  }
}
