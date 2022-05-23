part of 'home_widgets_imports.dart';
class BuildLoadingView extends StatelessWidget {
  const BuildLoadingView({
    required this.mediaQuery,
    required this.statusBarHeight,
  })  ;

  final Size mediaQuery;
  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

        height: mediaQuery.height - statusBarHeight,
        width: mediaQuery.width,
        child: const Center(child: CircularProgressIndicator()));
  }
}
