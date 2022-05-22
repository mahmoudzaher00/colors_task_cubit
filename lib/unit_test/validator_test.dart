class TextFieldValidator{
  static String? validate(String? value){
    if (value!.isEmpty){
      return 'please enter data';
    }
    if (value.length < 6) {
      return 'text must be more than 5 Characters';
    } else if (value.length > 9) {
      return 'Text is only allowed and max 9 Characters';
    }
  }
   String? validation(String? value){
    if (value!.length < 6) {
      return 'text must be more than 5 Characters';
    } else if (value.length > 9) {
      return 'Text is only allowed and max 9 Characters';
    }
  }
}