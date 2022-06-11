part of'view_imports.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List x=['s','dsd','dsds','dsdsd','dsds','sdsdsds'];
  final li = List<String>.generate(20, (index) => "Item Number${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Color Home',
            color: Colors.white,
          ),
          leading: const SizedBox.shrink(),
          leadingWidth: 0,
        ),
        body: BlocConsumer<MarwanCubit,MarwanState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            final controller = MarwanCubit.get(context);
            return Column(
              children: [
                ListView.builder(
                  itemCount: x.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final item = li[index];

                   return Dismissible(
                     key: Key(item),
                     onDismissed: (DismissDirection dir) {
                       setState(() =>
                           li.removeAt(index)); // used to dismiss any item i want
                       Scaffold.of(ctx).showSnackBar(SnackBar(
                         content: Text(dir == DismissDirection.startToEnd
                             ? "$item Deleted"
                             : "$item Liked"),
                         action: SnackBarAction(
                           label: "Undo",
                           textColor: Colors.white,
                           onPressed: () {
                             setState(() {
                               li.insert(index, item); //used to insert the item that we have dismissed before
                             });
                           },
                         ),
                       ));
                     },
                     confirmDismiss:(DismissDirection dir)async{
                       if(dir==DismissDirection.startToEnd){
                         setState(() {
                           li.removeAt(index);
                         });
                         // final bool res = await showDialog(context: context,
                         //     builder: (BuildContext ctx){
                         //       return AlertDialog(
                         //         content: Text("Do you want to delete this $item?"),
                         //         actions: [
                         //           TextButton(
                         //             child: const Text("Cancel",style: TextStyle(color: Colors.black),),
                         //             onPressed:(){
                         //               Navigator.of(context).pop();
                         //             } ,
                         //           ),
                         //           TextButton(
                         //             child: const Text("Delete"),
                         //             onPressed: (){
                         //               setState(() {
                         //                 li.removeAt(index);
                         //               });
                         //               Navigator.of(context).pop();
                         //             }, )
                         //         ],
                         //       );
                         //     }
                         // );
                       }
                     } ,
                     child: ListTile(
                       title: Center(
                         child: Text(item),
                       ),
                     ),
                     background: Container(
                       color: Colors.deepOrange,
                       alignment: Alignment.centerLeft,
                       child: const Icon(Icons.delete),
                     ),
                     secondaryBackground: Container(
                       color: Colors.green,
                       alignment: Alignment.centerRight,
                       child: const Icon(Icons.thumb_up_alt_rounded),
                     ),
                   );
                  }),

            //  Dismissible(
                    //  key: Key(x[index]),
                    //   onDismissed: (dir) {
                    //    setState(() {
                    //      x.removeAt(index);
                    //      Scaffold.of(ctx).showSnackBar(SnackBar(
                    //          content: Text(dir == DismissDirection.startToEnd
                    //          ? "${x[index]} Deleted"
                    //              : "${x[index]} Liked"),
                    //      action: SnackBarAction(
                    //      label: "Undo",
                    //      textColor: Colors.white,
                    //      onPressed: () {
                    //      setState(() {
                    //      x.insert(index, x[index]); //used to insert the item that we have dismissed before
                    //      });
                    //
                    //
                    //
                    //      })));
                    //    });
                    //   },
                    //  confirmDismiss:(DismissDirection dir)async{
                    //    if(dir==DismissDirection.startToEnd){
                    //      final bool res = await showDialog(context: context,
                    //          builder: (BuildContext ctx){
                    //            return AlertDialog(
                    //              content: Text("Do you want to delete this ${x[index]}?"),
                    //              actions: [
                    //                TextButton(
                    //                  child: const Text("Cancel",style: TextStyle(color: Colors.black),),
                    //                  onPressed:(){
                    //                    Navigator.of(context).pop();
                    //                  } ,
                    //                ),
                    //                TextButton(
                    //                  child: const Text("Delete"),
                    //                  onPressed: (){
                    //                    setState(() {
                    //                      x.removeAt(index);
                    //                    });
                    //                    Navigator.of(context).pop();
                    //                  }, )
                    //              ],
                    //            );
                    //          }
                    //      );
                    //    }
                    //  } ,
                    //  background: Container(
                    //    color: Colors.deepOrange,
                    //    alignment: Alignment.centerLeft,
                    //    child: const Icon(Icons.delete),
                    //  ),
                    //  secondaryBackground: Container(
                    //    color: Colors.green,
                    //    alignment: Alignment.centerRight,
                    //    child: const Icon(Icons.thumb_up_alt_rounded),
                    //  ),
                    //
                    //
                    //
                    //  child: Container(
                    //     height: 40,
                    //     width: double.infinity,
                    //     color: Colors.white,
                    //     padding: const EdgeInsets.all(8),
                    //     child: Row(
                    //       children: [
                    //         Text('${x[index]}'),
                    //         VerticalDivider(),
                    //
                    //         InkWell(
                    //             onTap: (){
                    //               controller.iMinimize();
                    //
                    //             },
                    //             child: Icon(Icons.minimize)
                    //         ),
                    //         Text('${controller.i}'),
                    //         InkWell(
                    //             onTap: (){
                    //               controller.iPlus();
                    //
                    //             },
                    //             child: Icon(Icons.add)),
                    //
                    //
                    //       ],
                    //     ),
                    //
                    //   ),
                    // );

                Center(
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

                ),
              ],
            );
          },
        ));
  }
}


