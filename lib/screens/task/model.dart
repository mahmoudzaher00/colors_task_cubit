class ColorsDataModel {
  late final String red;
  late final GroupOfColors groupOfColors;

  ColorsDataModel.fromJson(Map<String, dynamic> json){
    red = json['red'];
    groupOfColors = GroupOfColors.fromJson(json['groupOfColors']);
  }
}

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

class AsyncValidationColors {
  late final String color;
  late final String error;
  late final String errorMessage;

  AsyncValidationColors.fromJson(Map<String, dynamic> json){
    color = json['color'];
    error = json['error'];
    errorMessage = json['errorMessage'];
  }

}

class PersonalFavoriteColors {
  late final List<AddToTheseColors> addToTheseColors;

  PersonalFavoriteColors.fromJson(Map<String, dynamic> json){
    addToTheseColors = List.from(json['addToTheseColors']).map((e)=>AddToTheseColors.fromJson(e)).toList();
  }
}

class AddToTheseColors {
  late final String myFavoriteColor;
  late final String secondFavoriteColor;

  AddToTheseColors.fromJson(Map<String, dynamic> json){
    myFavoriteColor = json['myFavoriteColor'];
    secondFavoriteColor = json['secondFavoriteColor'];
  }
}