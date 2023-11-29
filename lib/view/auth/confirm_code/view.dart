import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_app/shared/design/app_button.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/confirm_code/bloc.dart';
import 'package:thimar_app/view/auth/confirm_code/states.dart';
import 'package:thimar_app/view/auth/register/view.dart';


class ConfirmCodeView extends StatefulWidget {
  final bool isActive;
  final String phone;
  const ConfirmCodeView({super.key, required this.isActive, required this.phone});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ConfirmCodeCubit(),
  child: Builder(
    builder: (context) {
      ConfirmCodeCubit cubit = BlocProvider.of(context);
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
                    widget.isActive?"تفعيل الحساب":"نسيت كلمة المرور",
                    style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                    style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "+${widget.phone} ",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                        "تغيير رقم الجوال",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: cubit.codeController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 70,
                        inactiveColor: const Color(0xffF3F3F3),
                        selectedColor: Theme.of(context).primaryColor,
                      ),
                      keyboardType: TextInputType.number,
                      ),
                  const SizedBox(
                    height: 35,
                  ),
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      if(state is ConfirmCodeIsLoadingState){
                        return const Center(child: CircularProgressIndicator(),);
                      }else{
                        return AppButton
                          (
                          text: "تأكيد الكود",
                          onPress: () {
                            cubit.verify(phone: widget.phone,isActive: widget.isActive);
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w300
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  cubit.isTimerFinished?const SizedBox.shrink():
                  CircularCountDownTimer(
                      duration: 90,
                      initialDuration: 0,
                      width: 66,
                      height: 70,
                      ringColor: Theme.of(context).primaryColor,
                      fillColor: const Color(0xffD8D8D8),
                      strokeWidth: 3,
                      onComplete: () {
                        cubit.isTimerFinished = true;
                        setState(() {

                        });
                      },
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverseAnimation: true,
                      ),
                  const SizedBox(
                    height: 21,
                  ),
                  cubit.isTimerFinished?
                  Center(
                    child: OutlinedButton(
                      onPressed: ()async{
                        await cubit.resend(phone: widget.phone);
                        cubit.isTimerFinished = false;
                        setState(() {

                        });
                      },
                      child: const Text(
                        "إعادة الإرسال",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ):const SizedBox.shrink(),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " لديك حساب بالفعل ؟",
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
              )
          ),
        );
    }
  ),
);
  }
}
