import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cubit/screens/home/view_imports.dart';
import 'package:task_cubit/shared/home_cubit/states.dart';
import 'package:flutter/services.dart';

import '../../models/main_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeViewData homeViewData = HomeViewData();

  //bool isThirdShow = true;
  bool get showTextField => homeViewData.showTextField;

  Future<void> getData() async {
    final String response = await rootBundle.loadString('assets/colors.json');
    final data = ColorsDataModel.fromJson(json.decode(response));
    homeViewData.items = data.groupOfColors.asyncValidationColors;
    homeViewData.autoSuggestionsColors =
        data.groupOfColors.autoSuggestionsColors;
    homeViewData.addToTheseColor =
        data.groupOfColors.personalFavoriteColors.addToTheseColors;
    homeViewData.textEditingFourController.text =
        homeViewData.addToTheseColor![0].myFavoriteColor;

    emit(GetHomeState());
  }

  //text field one validation and on change

  textFieldOneOnChanged(String textValue, context) {
    if (textValue.toLowerCase() == "a") {
      homeViewData.showTextField = true;
    } else {
      homeViewData.showTextField = false;
      if (textValue.length > 5 && textValue.length < 10) {

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("done"),
          duration: Duration(milliseconds: 600),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("text must be more than 5 and max 9 Characters"),
            duration: Duration(milliseconds: 600)));
      }
    }

    emit(ShowTextField());
  }

  String? textFieldOneValidator(String? value) {
    if (value!.isEmpty) {
      return 'please enter data';
    }
    if (value.length < 6) {
      return 'text must be more than 5 Characters';
    } else if (value.length > 9) {
      return 'Text is only allowed and max 9 Characters';
    } else {
      homeViewData.isShow = true;
    }
  }

  //text field two validation and on change
  String? textFieldTwoValidator(String? value) {
    if (value!.isEmpty) {
      return 'please enter data';
    } else if (value.toLowerCase() ==
        homeViewData.items![0].color.toLowerCase()) {
      return homeViewData.items![0].errorMessage;
    } else {
      homeViewData.isShow = true;
    }
  }

  textFieldTwoOnChanged(String value, context) {
    if (value.toLowerCase() ==homeViewData. items![0].color.toLowerCase()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(homeViewData.items![0].errorMessage),
          duration: const Duration(milliseconds: 600)));
    }
    emit(ShowTextField());
  }

  //text field three and four validation

  String? textFieldsValidation(String? value) {
    if (value!.isEmpty) {
      return 'please enter data';
    } else {
      homeViewData. isShow = true;
    }
  }


}
