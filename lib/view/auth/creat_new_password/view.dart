import 'package:flutter/material.dart';
import 'package:thimar_app/shared/design/app_button.dart';
import 'package:thimar_app/shared/design/app_input.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/register/view.dart';

class CreatNewPasswordView extends StatefulWidget {
  const CreatNewPasswordView({super.key});

  @override
  State<CreatNewPasswordView> createState() => _CreatNewPasswordViewState();
}

class _CreatNewPasswordViewState extends State<CreatNewPasswordView> {

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                "نسيت كلمة المرور",
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "أدخل كلمة المرور الجديدة",
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppInput(
                      labelText: "كلمة المرور",
                      controller: passwordController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "كلمه المرور مطلوبه";
                        }else if(value.length<9){
                          return "يجب ان تكون كلمه المرور مكونه من 9 ارقام";
                        }else{
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
                      labelText: "تاكيد كلمة المرور",
                      controller: confirmPasswordController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "تاكيد كلمه المرور مطلوبه";
                        }  else if(value != passwordController.text){
                          return " كلمتا المرور غير متطابقتين";
                        } else{
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
                height: 35,
              ),
              AppButton
                (
                text: "تغيير كلمة المرور",
                onPress: () {
                  if(formKey.currentState!.validate())
                  {

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
                    onPressed: (){
                      toGetNavigate(
                        const RegisterView(),
                      );
                    },
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
