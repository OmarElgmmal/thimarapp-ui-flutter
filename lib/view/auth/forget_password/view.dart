import 'package:flutter/material.dart';
import 'package:thimar_app/shared/design/app_button.dart';
import 'package:thimar_app/shared/design/app_input.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/confirm_code/view.dart';
import 'package:thimar_app/view/auth/register/view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

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
                "أدخل رقم الجوال المرتبط بحسابك",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: formKey,
                child: AppInput(
                  labelText: "رقم الجوال",
                  controller: phoneController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "رقم الهاتف مطلوب";
                    }else if(value.length<11){
                      return "يجب ان يكون رقم الهاتف مكون من 11 رقم";
                    }else{
                      return null;
                    }
                  },
                  icon: "assets/icons/phone.png",
                  isPhone: true,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              AppButton
                (
                text: "تأكيد رقم الجوال",
                onPress: () {
                  if(formKey.currentState!.validate())
                  {
                    toGetNavigate(ConfirmCodeView(isActive: false,phone: phoneController.text),);
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