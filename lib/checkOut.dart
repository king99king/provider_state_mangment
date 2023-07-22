import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/Cart.dart';

class checkOut extends StatefulWidget {
  const checkOut({Key? key}) : super(key: key);

  @override
  State<checkOut> createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => Cart(),

        child: Consumer<Cart>(
          builder: (context,cart,child){
            print(cart.getItems.length);
            return ListView.builder(
                itemCount: cart.getItems.length,
                itemBuilder: (context,index){
                  return Card(
                    color: Colors.blue,
                      child: ListTile(
                          title: Text(cart.getItems[index].name),
                          // trailing: IconButton(
                          //   onPressed: (){
                          //     cart.remove(cart.getItems[index]);
                          //
                          //   }
                          //   , icon: const Icon(Icons.remove),
                          //
                          // )
                      )
                  );
                });
          }
        ),
      )
    ));
  }
}
