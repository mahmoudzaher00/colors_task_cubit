import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:task_cubit/screens/task/controller.dart';
import 'package:task_cubit/screens/task/states.dart';

import 'model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: _mediaQuery.height*.05,
                              ),
                              TextFormField(
                                controller: controller.textEditingOneController,
                                enableSuggestions: true,
                                decoration: const InputDecoration(
                                  hintText: 'Enter data please',
                                ),
                                onChanged: (value) {
                                  controller.showTextFieldFunction(
                                      value, context);
                                },
                                validator: controller.textFieldOneValidate
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              controller.showTextField == false
                                  ? TextFormField(
                                      controller:
                                          controller.textEditingTwoController,
                                      onChanged: (value) {
                                        controller.onChangeTwo(value, context);
                                      },
                                    ):const SizedBox.shrink(),
                              const SizedBox(
                                height: 10,
                              ),
                              Autocomplete(
                                optionsBuilder: (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text.isEmpty) {
                                    return const Iterable<String>.empty();
                                  } else {
                                    return
                                    controller.autoSuggestionsColors!.where((element) => element.toLowerCase()
                                        .contains(controller.textEditingThreeController.text.toLowerCase()));
                                  }
                                },
                                optionsViewBuilder:
                                    (context, Function(String) onSelected, options) {
                                  return Material(
                                    elevation: 4,
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        final option = options.elementAt(index);

                                        return ListTile(
                                          // title: Text(option.toString()),
                                          title: SubstringHighlight(
                                            text: option.toString(),
                                            term: controller.textEditingThreeController.text,
                                            textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
                                          ),
                                          subtitle: Text("This is subtitle"),
                                          onTap: () {
                                            onSelected(option.toString());
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) => Divider(),
                                      itemCount: options.length,
                                    ),
                                  );
                                },
                                onSelected: (selectedString) {
                                  print(selectedString);
                                },
                                fieldViewBuilder:
                                    (context, controllerView, focusNode, onEditingComplete) {
                                 controller.textEditingThreeController = controllerView;
                                  return TextFormField(
                                    controller: controller.textEditingThreeController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,

                                  );
                                },
                              ),
                              TextFormField(
                                controller: controller.textEditingFourController,
                                enableSuggestions: true,
                                onChanged: (value) {
                                },
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print('gogog');
                                    }
                                  },
                                  icon: const Icon(Icons.email))
                            ],
                          ),
                        )),
                  ),
                ));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
