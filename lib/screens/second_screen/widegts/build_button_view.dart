part of 'second_screen_widget_imports.dart';

class CustomElevatedBtn extends StatelessWidget {
  CustomElevatedBtn({
    required this.onPressedFunction,
    required this.childWidget,
    required this.backgroundColor,
    this.borderRadius,
  });

  final VoidCallback onPressedFunction;
  final Widget childWidget;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunction,
      //     (){
      //   Navigator.pop(context);
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
      //
      // }

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: borderRadius!,
          ))),
      child: childWidget
      // CustomText(
      //   text: 'Back to previous screen',
      //   fontSize: 15,
      //   fontWeight: FontWeight.w600,
      //   color: Colors.white,
      //   alignment: Alignment.center,
      // ),
    );
  }
}
