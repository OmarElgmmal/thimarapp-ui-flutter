import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/view/auth/confirm_code/states.dart';

import '../../../shared/logic/dio_helper.dart';
import '../../../shared/logic/helper_methods.dart';
import '../creat_new_password/view.dart';
import '../login/view.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeStates>{
  ConfirmCodeCubit():super(ConfirmCodeStates(),);

  bool isPasswordHidden = true;
  bool isTimerFinished = false;
  final codeController = TextEditingController();
  bool isLoading = false;


  Future<void> resend ({required String phone})async{
    await DioHelper().sendData(
      "resend_code",
      data: {
        "phone" : phone,
      },
    );
  }


  Future<void> verify({required String phone,required bool isActive})async{
    emit(ConfirmCodeIsLoadingState(),);
    final response = await DioHelper().sendData(
      "verify",
      data: {
        "code" : codeController.text,
        "type" : Platform.operatingSystem,
        "device_token" : "test",
        "phone" : phone,
      },
    );
    if(response.isSuccess)
    {
      showMessage(response.message,type: MessageType.success);
      if(isActive){
        toGetNavigate(const LoginView(),);
      }else{
        toGetNavigate(const CreatNewPasswordView(),);
      } emit(ConfirmCodeSuccessState(),);
    }else{
      showMessage(response.message);
    }
    emit(ConfirmCodeFailedState(),);
  }

}