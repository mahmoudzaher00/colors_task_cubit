part of 'home_widgets_imports.dart';

class BuildInputsFields extends StatelessWidget {
  BuildInputsFields({required this.controller,required this.mediaQuery,required this.statusBarHeight});


  final ColorsController controller;
  final Size mediaQuery;
  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SizedBox(
              height: mediaQuery.height * .05,
            ),
            TextFormField(
                controller:
                controller.textEditingOneController,
                enableSuggestions: true,
                decoration: const InputDecoration(
                  hintText: 'Enter data please',
                ),
                onChanged: (value) {
                  controller.showTextFieldFunction(
                      value, context);
                },
                validator: controller.textFieldOneValidate),
            controller.showTextField == false
                ? TextFormField(
              controller:
              controller.textEditingTwoController,
              onChanged: (value) {
                controller.validationColors(
                    value, context);
              },
            )
                : const SizedBox.shrink(),
            Autocomplete(
              optionsBuilder:
                  (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                } else {
                  return controller.autoSuggestionsColors!
                      .where((element) => element
                      .toLowerCase()
                      .contains(controller
                      .textEditingThreeController.text
                      .toLowerCase()));
                }
              },
              optionsViewBuilder: (context,
                  Function(String) onSelected, options) {
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
                          term: controller
                              .textEditingThreeController
                              .text,
                          textStyleHighlight: const TextStyle(
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          onSelected(option.toString());
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                    const   Divider(),
                    itemCount: options.length,
                  ),
                );
              },
              onSelected: (selectedString) {
                print(selectedString);
              },
              fieldViewBuilder: (context, controllerView,
                  focusNode, onEditingComplete) {
                controller.textEditingThreeController =
                    controllerView;
                return TextFormField(
                  controller:
                  controller.textEditingThreeController,
                  focusNode: focusNode,
                  onEditingComplete: onEditingComplete,
                );
              },
            ),
            TextFormField(
              controller:
              controller.textEditingFourController,
              enableSuggestions: true,
              onChanged: (value) {},
            ),
            CustomButton(
              controller: controller,
              text: 'Confirm',
              onPressed: () {
                if (controller.formKey.currentState!
                    .validate()) {
                  controller.formKey.currentState!.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const SecondScreen()));
                }
              },
            ),
          ],
        )) ;
  }


}
