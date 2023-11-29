import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/products/model.dart';
import 'package:thimar_app/features/products/states.dart';
import '../../shared/logic/dio_helper.dart';


class ProductsCubit extends Cubit<ProductsStates>{
  ProductsCubit() :super(ProductsStates());
  
  Future<void> getData()async{
    emit(ProductsLoadingState());
    final response = await DioHelper().getData("products");
    print(response.reponse?.data);
    if(response.isSuccess){
      final model = ProductsData.fromJson(response.reponse!.data);
      emit(ProductsSuccessState(list: model.list));
    } else {
      emit(ProductsFailedState(msg: response.message));
    }
  }
  
}