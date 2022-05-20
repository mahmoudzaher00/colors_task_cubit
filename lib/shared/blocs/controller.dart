import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cubit/models/add_to_these_colors_model.dart';
import 'package:task_cubit/models/AsyncValidationColorsModel.dart';
import 'package:task_cubit/shared/blocs/states.dart';
import 'package:flutter/services.dart';

import '../../models/main_model.dart';

class ColorsController extends Cubit<ColorsStates> {
  ColorsController() : super(ColorsInitialState());

  static ColorsController get(context) => BlocProvider.of(context);
  final textEditingOneController = TextEditingController();
  final textEditingTwoController = TextEditingController();
  var textEditingThreeController = TextEditingController();
  final textEditingFourController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<AsyncValidationColors>? items;
  List<AddToTheseColors>? addToTheseColor;
  List<String>? autoSuggestionsColors;
  bool _showTextField = false;
  bool isThirdShow = true;
  bool get showTextField => _showTextField;

  Future<void> getData() async {
    final String response = await rootBundle.loadString('assets/colors.json');
    final data = ColorsDataModel.fromJson(json.decode(response));
    items = data.groupOfColors.asyncValidationColors;
    autoSuggestionsColors=data.groupOfColors.autoSuggestionsColors;
    addToTheseColor=data.groupOfColors.personalFavoriteColors.addToTheseColors;
    textEditingFourController.text= addToTheseColor![0].myFavoriteColor;
    print(addToTheseColor![0].myFavoriteColor);
    emit(GetColorsState());
  }

  showTextFieldFunction(String textValue,context) {
    if (textValue.toLowerCase() == "a") {
      _showTextField = true;
    } else {
      _showTextField = false;
      if(textValue.length>5&&textValue.length<10)
      {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("done"),duration: Duration(milliseconds: 600),));
      }else
      {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text("text must be more than 5 and max 9 Characters"),duration:  Duration(milliseconds: 600)));
      }
    }

    emit(ShowTextField());
  }

  String? textFieldOneValidate(String? value) {
    if (textEditingOneController.text.length < 6) {
      return 'text must be more than 5 Characters';
    } else if (textEditingOneController.text.length > 9) {
      return 'Text is only allowed and max 9 Characters';
    }
    return null;
  }

  validationColors(String value,context) {
    if(value.toLowerCase() ==items![0].color.toLowerCase())
      {
        isThirdShow=false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(items![0].errorMessage),duration: const Duration(milliseconds: 600)));
      }else
        {
          isThirdShow=true;
        }
    emit(ShowTextField());
  }
}
