//
//
// class ProvOne with ChangeNotifier {
//   String name = "abc";
//   get name1{
//     return name;
//   }
//    void changeName() {
//     name = "xyz";
//     notifyListeners();
//   }
//   var id=1;
//    get id1{
//      return id;
//    }
//   void changeId() {
//      id++;
//      notifyListeners();
//    }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/main.dart';
class MultiPro extends StatefulWidget {
  const MultiPro({Key? key}) : super(key: key);

  @override
  State<MultiPro> createState() => _MultiProState();
}

class _MultiProState extends State<MultiPro> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProvOne()),
          ChangeNotifierProvider(create: (context) => Model()),
        ],
        child:  Column(
          children:<Widget> [
            Consumer<ProvOne>(
              builder: (context,provone,child){
                return Text(provone.name);
              }

            ),
            Consumer<Model>(
              builder: (context,model,child){
                return Text(model.name);

              }
            )
          ]
        ),


      )
    ));
  }
}
