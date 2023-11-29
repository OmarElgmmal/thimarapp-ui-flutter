import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/categories/model.dart';
import 'package:thimar_app/features/categories/states.dart';
import 'package:thimar_app/shared/logic/dio_helper.dart';

class CategoriesCubit extends Cubit<CategoriesStates>{
  CategoriesCubit():super(CategoriesStates());

  Future<void> getData()async{
    emit(GetCategoryIsLoadingState(),);
    final response = await DioHelper().getData("categories",);
    print(response.reponse?.data);
    if(response.isSuccess){
      final model = CategoriesData.fromJson(response.reponse!.data);
      emit(GetCategorySuccessState(list: model.list),);
    }else{
      emit(GetCategoryFailedState(msg: response.message),);
    }
  }
}