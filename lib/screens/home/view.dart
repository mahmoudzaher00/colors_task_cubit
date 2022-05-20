import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cubit/shared/blocs/controller.dart';
import 'package:task_cubit/shared/blocs/states.dart';

import 'widgets/home_widgets_imports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (context) => ColorsController()..getData(),
      child: BlocConsumer<ColorsController, ColorsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = ColorsController.get(context);
          if (controller.items != null) {
            print(controller.items![0].error);
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




