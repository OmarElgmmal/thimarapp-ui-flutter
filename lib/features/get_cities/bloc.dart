import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/get_cities/states.dart';
import 'package:thimar_app/shared/logic/dio_helper.dart';
import '../../view/auth/register/model.dart';


class GetCitiesCubit extends Cubit<GetCitiesStates>{
  GetCitiesCubit():super(GetCitiesStates());


  void getData() async {
    emit(GetCitiesIsLoadingStates(),);
    final response = await DioHelper().getData("cities/1");
    if(response.isSuccess)
    {
      print(response.reponse!.data);
      final model = CitiesData.fromJson(response.reponse!.data);
      emit(GetCitiesSuccessStates(list: model.list),);
    }else{
      emit(GetCitiesFailedStates(),);
    }
  }
}
