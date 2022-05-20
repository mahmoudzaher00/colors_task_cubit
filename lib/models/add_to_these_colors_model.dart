class AddToTheseColors {
  late final String myFavoriteColor;
  late final String secondFavoriteColor;

  AddToTheseColors.fromJson(Map<String, dynamic> json){
    myFavoriteColor = json['myFavoriteColor'];
    secondFavoriteColor = json['secondFavoriteColor'];
  }
}