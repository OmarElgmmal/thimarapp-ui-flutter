  import 'model.dart';

class GetSliderStates{}

  class GetSliderSuccessState extends GetSliderStates{
    final List<SliderModel> list;

    GetSliderSuccessState({required this.list});
}
  class GetSliderIsLoadingState extends GetSliderStates{}

  class GetSliderFailedState extends GetSliderStates{
  final String msg;

  GetSliderFailedState({required this.msg});
}