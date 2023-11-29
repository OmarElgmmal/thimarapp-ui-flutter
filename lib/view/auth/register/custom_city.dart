import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/get_cities/bloc.dart';
import 'package:thimar_app/features/get_cities/states.dart';
import 'package:thimar_app/view/auth/register/model.dart';


class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              "اختر مدينتك",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
            BlocBuilder<GetCitiesCubit,GetCitiesStates>(builder: (context, state) {
              if(state is GetCitiesIsLoadingStates)
              {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }else if(state is GetCitiesSuccessStates)
              {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) =>
                        _ItemCity(model: state.list[index]),
                    itemCount: state.list.length,
                  ),
                );
              }else{
                return const Text("Failed");
              }
            },
            ),
          ],
        ),
      );
  }
}

class _ItemCity extends StatelessWidget {
  final CityModel model;

  const _ItemCity({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).primaryColor.withOpacity(.1),
        ),
        child: Center(
          child: Text(model.name),
        ),
      ),
    );
  }
}
