import 'model.dart';

class CategoriesStates{}

class GetCategoryIsLoadingState extends CategoriesStates{}

class GetCategorySuccessState extends CategoriesStates{
  final List<CategoryModel> list;

  GetCategorySuccessState({required this.list});
}

class GetCategoryFailedState extends CategoriesStates{
  final String msg;

  GetCategoryFailedState({required this.msg});
}