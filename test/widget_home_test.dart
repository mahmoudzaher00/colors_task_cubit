

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_cubit/screens/home/view_imports.dart';
import 'package:task_cubit/shared/home_cubit/cubit.dart';
import 'package:task_cubit/unit_test/validator_test.dart';

class MockHomeTest extends Mock implements HomeCubit,TextFieldValidator{}

void main(){

  Widget makeTestableWidget({Widget? child}){
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('first text field value = a', (WidgetTester tester) async {
    MockHomeTest mockColorsTest=MockHomeTest();
    // mockColorsTest.allValuesCorrect(BuildContext);

    Home home=const Home();
    await tester.pumpWidget(makeTestableWidget(child: home));

    verifyNever(mockColorsTest.textFieldOneOnChanged('a',BuildContext)).called(0);


  });
  testWidgets('second text field value = blue', (WidgetTester tester) async {
    MockHomeTest mockColorsTest=MockHomeTest();
    // mockColorsTest.allValuesCorrect(BuildContext);

    Home home=const Home();
    await tester.pumpWidget(makeTestableWidget(child: home,));

    await tester.tap(find.byKey(Key('Confirm')));

    verifyNever(mockColorsTest.textFieldsValidation('colors'));
    verifyNever(mockColorsTest.textFieldTwoOnChanged('blue', BuildContext));
    verifyNever(mockColorsTest.textFieldOneValidator('orange'));
    verifyNever(mockColorsTest.textFieldTwoValidator('green'));
    verifyNever(mockColorsTest.homeViewData.allValuesCorrect(BuildContext));

  });

  testWidgets('first text field value less than 5', (WidgetTester tester) async {
    MockHomeTest mockColorsTest=MockHomeTest();
    // mockColorsTest.allValuesCorrect(BuildContext);

    Home home=const Home();
    await tester.pumpWidget(makeTestableWidget(child: home));

    verifyNever(mockColorsTest.textFieldsValidation('colors'));
    verifyNever(mockColorsTest.textFieldTwoOnChanged('red', BuildContext));
    verifyNever(mockColorsTest.textFieldOneValidator('col'));
    verifyNever(mockColorsTest.textFieldTwoValidator('green'));


  });

  testWidgets('text field one empty', (WidgetTester tester) async{
    Home home=const Home();

    await tester.pumpWidget(makeTestableWidget(child: home));
    Finder firstInput=find.byKey(Key('text field one'));
    expect(firstInput, findsOneWidget);


  });
  testWidgets('should have Confirm button', (WidgetTester tester)async{
    MockHomeTest mockHomeTest=MockHomeTest();
    Home home=const Home();
    await tester.pumpWidget(
        makeTestableWidget(child: home,)
    );
    Finder dd=find.byType(TextButton);
    await tester.tap(dd);
    await tester.pumpAndSettle();
    expect(dd, findsOneWidget);


});
  testWidgets('text fields empty', (WidgetTester tester) async {

    MockHomeTest mockHomeTest=MockHomeTest();

    Home home=const Home();
    await tester.pumpWidget(
       makeTestableWidget(child: home,)
    );
   // await tester.tap(find.text('Confirm'));
    Finder click=find.text('Confirm');
    expect(click, findsOneWidget);
    // await tester.tap(find.byKey(const Key('click')));
    // var x=mockHomeTest.homeViewData.allValuesCorrects('','','','',BuildContext);
    // verifyNever(x);
    // expect(x, null);

  });






  testWidgets('when all value is true', (WidgetTester tester) async {
    MockHomeTest mockColorsTest=MockHomeTest();
    Home home=const Home();
    await tester.pumpWidget(makeTestableWidget(child: home));
    Finder firstInput=find.byKey(Key('1'));
    await tester.enterText(firstInput, 'orange');

    Finder secondInput=find.byKey(Key('2'));
    await tester.enterText(secondInput, 'brown');

    Finder thirdInput=find.byKey(Key('3'));
    await tester.enterText(thirdInput, 'green');

    Finder fourthInput=find.byKey(Key('4'));
    await tester.enterText(fourthInput, 'red');
    
    await tester.tap(find.byKey(Key('Confirm')));

    verify(mockColorsTest.homeViewData.allValuesCorrect(BuildContext));

  });

}