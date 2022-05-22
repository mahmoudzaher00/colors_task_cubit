part of'view_imports.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Home',
            color: Colors.white,
          ),
          leading: const SizedBox.shrink(),
          leadingWidth: 0,
        ),
        body: Center(
            child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width*.6,
                child: CustomElevatedBtn(
                  backgroundColor: Colors.blue,
                  childWidget:  const CustomText(
                    text: 'Back to previous screen',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                  onPressedFunction: (){
                        Navigator.pop(context);
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
                  },
                  borderRadius: BorderRadius.circular(12),
                ),
              )

        ));
  }
}


