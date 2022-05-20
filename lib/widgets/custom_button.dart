import 'package:flutter/material.dart';
import 'package:task_cubit/shared/blocs/controller.dart';
import 'package:task_cubit/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.controller,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  ColorsController? controller;
  final String text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: CustomText(
          text: text,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.blue,
        ),
    );
  }
}