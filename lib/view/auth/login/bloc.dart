import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/view/auth/login/states.dart';
import '../../../shared/logic/cache_helper.dart';
import '../../../shared/logic/dio_helper.dart';
import '../../../shared/logic/helper_methods.dart';
import '../../home/view.dart';
import 'model.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginStates(),);

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(GetIsLoadingState(),);
      final response = await DioHelper().sendData(
        "login",
        data: {
          "phone": phoneController.text,
          "password": passwordController.text,
          "type": Platform.operatingSystem,
          "device_token": "test",
          "user_type": "client",
        },
      );
      print(response.reponse?.data);
      if (response.isSuccess) {
        final model = UserData.fromJson(response.reponse!.data);
        if (model.model.isActive) {
          await CacheHelper.saveUserData(model.model);
          showMessage(response.message, type: MessageType.success);
          emit(GetSuccessState(),);
          toGetNavigate(
            const HomeView(),
          );
        }
        }else{
        print(response.message);
        showMessage(
          response.message,
        );
        emit(GetFailedState(),);
      }
    }
  }
}