part of 'view_imports.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = HomeCubit.get(context);
          if (controller.homeViewData.items != null) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child:  BuildInputsFields(controller: controller, mediaQuery: _mediaQuery, statusBarHeight: statusBarHeight),
                ));
          } else {
            return BuildLoadingView(
                mediaQuery: _mediaQuery, statusBarHeight: statusBarHeight);
          }
        },
      ),
    );
  }
}




