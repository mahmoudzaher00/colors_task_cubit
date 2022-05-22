part of 'home_widgets_imports.dart';

class BuildTextFieldView extends StatelessWidget {
  BuildTextFieldView({
    required this.controller,
    required this.hintText,
    this.keyValue,
    this.focusNode,
    this.onChangedFunction,
    this.validatorFunction,
    this.onEditingCompleteFunction,
  });

  final TextEditingController controller;


  final String hintText;
  String? keyValue;
  ValueChanged<String>? onChangedFunction;
  FormFieldValidator<String>? validatorFunction;
  VoidCallback? onEditingCompleteFunction;
  FocusNode? focusNode;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: Key('text field one'),
        controller: controller,
        enableSuggestions: true,
        decoration: const InputDecoration(
          hintText: 'Enter data please',
        ),
        onChanged: onChangedFunction,
        focusNode: focusNode,
        onEditingComplete: onEditingCompleteFunction,
        validator:validatorFunction,

      //controller.textFieldOneValidator
    );
  }
}