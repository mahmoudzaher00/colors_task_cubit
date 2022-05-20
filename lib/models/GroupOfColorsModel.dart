import 'package:task_cubit/models/AsyncValidationColorsModel.dart';
import 'package:task_cubit/models/PersonalFavoriteColorsModel.dart';

class GroupOfColors {
  late final List<AsyncValidationColors> asyncValidationColors;
  late final List<String> autoSuggestionsColors;
  late final PersonalFavoriteColors personalFavoriteColors;

  GroupOfColors.fromJson(Map<String, dynamic> json){
    asyncValidationColors = List.from(json['asyncValidationColors']).map((e)=>AsyncValidationColors.fromJson(e)).toList();
    autoSuggestionsColors = List.castFrom<dynamic, String>(json['autoSuggestionsColors']);
    personalFavoriteColors = PersonalFavoriteColors.fromJson(json['personalFavoriteColors']);
  }

}