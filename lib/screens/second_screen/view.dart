import 'package:flutter/material.dart';
import 'package:task_cubit/widgets/custom_button.dart';
import 'package:task_cubit/widgets/custom_text.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Home',
          ),
        ),
        body: Center(
          child: CustomButton(
            text:'Back to previous screen',
            onPressed:()=> Navigator.pop(context) ,
          )
        ));
  }
}
