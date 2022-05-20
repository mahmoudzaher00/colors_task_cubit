part of 'home_widgets_imports.dart';
class BuildLoadingView extends StatelessWidget {
  const BuildLoadingView({
    Key? key,
    required Size mediaQuery,
    required this.statusBarHeight,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: _mediaQuery.height - statusBarHeight,
        width: _mediaQuery.width,
        child: const Center(child: CircularProgressIndicator()));
  }
}
