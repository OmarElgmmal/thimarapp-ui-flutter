import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/slider/states.dart';

import '../../shared/logic/dio_helper.dart';
import 'model.dart';

class GetSliderCubit extends Cubit<GetSliderStates>{
  GetSliderCubit():super(GetSliderStates(),);

  Future<void> getData()async{
    emit(GetSliderIsLoadingState(),);
    final response = await DioHelper().getData("sliders",);
    print(response.reponse?.data);
    if(response.isSuccess)
    {
      final model = SliderData.fromJson(response.reponse!.data);
      emit(GetSliderSuccessState(list: model.list),);
    }else{
      emit(GetSliderFailedState(msg: response.message),);
    }
  }
}