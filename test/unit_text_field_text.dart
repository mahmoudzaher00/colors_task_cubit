import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_cubit/unit_test/validator_test.dart';
void main(){
  test('validator', (){

  });
  test('please enter data', (){
   //TextField field;
    var result=TextFieldValidator.validate('');
    expect(result, 'please enter data');
  });
  test('text field value allowed max 9 Characters', (){
    var result=TextFieldValidator.validate('1234567891');
    expect(result, 'Text is only allowed and max 9 Characters');
  });

  test('text field value must be more than 5 Characters', (){
    var result=TextFieldValidator.validate('sd');
    expect(result, 'text must be more than 5 Characters');
  });

  test('text field take right value between 5 to 9 Characters', (){
    var result=TextFieldValidator.validate('123456789');
    expect(result, null);
  });


}