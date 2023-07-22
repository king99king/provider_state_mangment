import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/Cart.dart';
import 'package:providerstate/Home.dart';
import 'package:providerstate/showSome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class testPro extends StatefulWidget {
  const testPro({Key? key}) : super(key: key);

  @override
  State<testPro> createState() => _testProState();
}

class _testProState extends State<testPro> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvOne(),
      child:SafeArea(
        child:  Scaffold(
          body: ListView(
            children:<Widget> [
              Selector<ProvOne,String>(
                selector: (context,provone1)=> provone1.name,
                builder: (context,provone,child){
                  return Text(provone);
                }
              ),
              Selector<ProvOne,int>(
                  selector: (context,provone1)=> provone1.id,
                  builder: (context,provone,child){
                    return Text(provone.toString());
                  }
              ),
              Consumer<ProvOne>(
                  builder: (context,provone,child){
                    return TextButton( onPressed: (){
                      provone.changeName();
                    }
                    , child: const Text("click"));
                  }
              ),
              Consumer<ProvOne>(
                  builder: (context,provone,child){
                    return TextButton( onPressed: (){
                      provone.changeId();
                    }
                        , child: const Text("change id"));
                  }
              ),
            ]
          ),

          // Consumer<Model>(
          //   builder: (context, model, child) {
          //     return Column(
          //         children:   [
          //           Center(child: Text(model.name,style: TextStyle(fontSize: 30),)),
          //           const SizedBox(height: 50,),
          //           MaterialButton(
          //             onPressed: (){
          //             model.changeName();
          //           }, color: Colors.red, child: const Text("click"),)
          //
          //
          //         ]
          //     );
          //   },
          // ),

        ),
      )
    );
  }
}
class Model with ChangeNotifier{
  String name = "King";
  get name1{
    return name;
  }
  changeName(){
    name = "flutter";
    notifyListeners();
  }
}
class ProvOne with ChangeNotifier {
  String name = "abc";
  get name1{
    return name;
  }
   changeName() {
    name = "xyz";
    notifyListeners();
  }
  int id=1;
  get id1{
    return id;
  }
   changeId() {
    id++;
    notifyListeners();
  }
}

