import 'package:task_cubit/models/add_to_these_colors_model.dart';

class PersonalFavoriteColors {
  late final List<AddToTheseColors> addToTheseColors;

  PersonalFavoriteColors.fromJson(Map<String, dynamic> json){
    addToTheseColors = List.from(json['addToTheseColors']).map((e)=>AddToTheseColors.fromJson(e)).toList();
  }
}