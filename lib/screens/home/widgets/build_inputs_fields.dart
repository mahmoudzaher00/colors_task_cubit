part of 'home_widgets_imports.dart';

class BuildInputsFields extends StatelessWidget {
  BuildInputsFields(
      {required this.controller,
      required this.mediaQuery,
      required this.statusBarHeight,
      });

  final HomeCubit controller;
  final Size mediaQuery;
  final double statusBarHeight;
  ScrollController scroll=ScrollController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.homeViewData.formKey,
        child: ListView(
          controller: scroll,
          padding: const EdgeInsets.all(8),
          children: [
            SizedBox(height: mediaQuery.height * .05,),

            const CustomText(
              text: 'Welcome back.....!',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              alignment: Alignment.center,
            ),
            SizedBox(height: mediaQuery.height * .02,),
            const CustomText(
              text: 'Please enter a valid data',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              alignment: Alignment.center,
            ),
            SizedBox(height: mediaQuery.height * .05,),
            BuildTextFieldView(

                controller: controller.homeViewData.textEditingOneController,
                hintText: 'Please enter data',
                onChangedFunction: (value) {
                  controller.textFieldOneOnChanged(value, context);
                },
                validatorFunction: TextFieldValidator.validate
                //controller.textFieldOneValidator ,

                ),
            SizedBox(height: mediaQuery.height * .05,),
            controller.showTextField == false ?
            BuildTextFieldView(
                    controller: controller.homeViewData.textEditingTwoController,
                    hintText: 'Enter your color please',
                    onChangedFunction: (value) {
                      controller.textFieldTwoOnChanged(value, context);
                    },
                    validatorFunction: controller.textFieldTwoValidator) :
            const SizedBox.shrink(),
            controller.showTextField == false ?
            SizedBox(height: mediaQuery.height * .05,) :
            const SizedBox.shrink(),
            autoCompleteTextField(),
            SizedBox(height: mediaQuery.height * .05,),
            BuildTextFieldView(
              controller: controller.homeViewData.textEditingFourController,
              hintText: 'Enter your color please',
              validatorFunction: controller.textFieldsValidation,
            ),
            SizedBox(height: mediaQuery.height * .05,),
            BuildConfirmBtn(controller: controller),
          ],
        ));
  }

  Autocomplete<String> autoCompleteTextField() {
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        } else {
          return controller.homeViewData.autoSuggestionsColors!.where(
              (element) => element.toLowerCase().contains(controller
                  .homeViewData.textEditingThreeController.text
                  .toLowerCase()));
        }
      },
      optionsViewBuilder: (context, Function(String) onSelected, options) {
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
                  term: controller.homeViewData.textEditingThreeController.text,
                  textStyleHighlight:
                      const TextStyle(fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  onSelected(option.toString());
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: options.length,
          ),
        );
      },
      onSelected: (selectedString) {
        print(selectedString);
      },
      fieldViewBuilder:
          (context, controllerView, focusNode, onEditingComplete) {
        controller.homeViewData.textEditingThreeController = controllerView;
        return BuildTextFieldView(
          controller: controller.homeViewData.textEditingThreeController,
          hintText: 'Enter your color please',
          focusNode: focusNode,
          onChangedFunction: (value) {
          if (scroll.hasClients) {
            final position = scroll.position.maxScrollExtent;
            scroll.jumpTo(position);
          }
        },
          validatorFunction: controller.textFieldsValidation,
          onEditingCompleteFunction: onEditingComplete,
        );
      },
    );
  }
}

class BuildConfirmBtn extends StatelessWidget {
  const BuildConfirmBtn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeCubit controller;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      controller: controller,
      text: 'Confirm',
      onPressed: () {
        if (controller.homeViewData.formKey.currentState!.validate()) {
          controller.homeViewData.formKey.currentState!.save();
          //controller.homeViewData.allValuesCorrect(context);
          controller.homeViewData.allValuesCorrects(
          controller.homeViewData.textEditingOneController.text,
          controller.homeViewData.textEditingTwoController.text,
          controller.homeViewData.textEditingThreeController.text,
          controller.homeViewData.textEditingFourController.text,
          context
          );
        }
      },
    );
  }
}
