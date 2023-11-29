import '../../view/auth/register/model.dart';

class GetCitiesStates{}

class GetCitiesIsLoadingStates extends GetCitiesStates{}
class GetCitiesSuccessStates extends GetCitiesStates{
  final List<CityModel> list;

  GetCitiesSuccessStates({required this.list});
}
class GetCitiesFailedStates extends GetCitiesStates{}