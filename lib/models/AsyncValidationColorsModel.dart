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
