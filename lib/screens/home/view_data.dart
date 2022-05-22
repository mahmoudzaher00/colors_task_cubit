part of 'view_imports.dart';


class HomeViewData {

  final textEditingOneController = TextEditingController();
  final textEditingTwoController = TextEditingController();
  var textEditingThreeController = TextEditingController();
  final textEditingFourController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShow = false;
  List<AsyncValidationColors>? items;
  List<AddToTheseColors>? addToTheseColor;
  List<String>? autoSuggestionsColors;
  bool showTextField = false;

  allValuesCorrect(context) {
    print('all values are correct');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SecondScreen()));
  }

  allValuesCorrects(txt1, txt2, txt3, txt4, context) {
    if (
    txt1 == textEditingOneController.text &&
        txt2 == textEditingTwoController.text &&
        txt3 == textEditingThreeController.text &&
        txt4 == textEditingFourController.text
    ) {
      print('all values are correct');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SecondScreen()));
    }
    else {
      print('text fields empty');
    }
  }
}
