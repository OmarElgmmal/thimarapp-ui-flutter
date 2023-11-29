import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/view/auth/register/states.dart';

import '../../../shared/logic/dio_helper.dart';
import '../../../shared/logic/helper_methods.dart';
import '../confirm_code/view.dart';
import 'model.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterStates(),);

  final formKey = GlobalKey<FormState>();
  CityModel? selectedCity;
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  Future<void> register()async{
    if (formKey.currentState!.validate()) {
      emit(RegisterIsLoadingState(),);
      final response = await DioHelper().sendData(
        "client_register",
        data: {
          "fullname" : fullnameController.text,
          "password" : passwordController.text,
          "password_confirmation" : confirmPasswordController.text,
          "phone" : phoneController.text,
          "country_id" : 1,
          "city_id" : selectedCity!.id,
        },
      );
      if(response.isSuccess)
      {
        showMessage(response.message,type: MessageType.success);
        toGetNavigate(ConfirmCodeView(isActive: true,phone: phoneController.text),);
        emit(RegisterSuccessState(),);
      }else{
        showMessage(response.message);
      }
      emit(RegisterFailedState(),);
    }
  }
}