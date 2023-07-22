import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/Cart.dart';
import 'package:providerstate/Items.dart';
import 'package:providerstate/checkOut.dart';
import 'package:providerstate/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Item> items=[
  Item(name: "item1",price: 100),
  Item(name: "item2",price: 200),
  Item(name: "item3",price: 300),
  Item(name: "item4",price: 400),
];
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => Cart(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const checkOut(),
                        )
                      );
                    }
                    , icon: const Icon(Icons.shopping_cart_rounded)
                  ),
                   Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.count}");
                    }
                  ),
                ],
              )
            ],
          ),
          body: ListView.builder(
            itemCount: items.length,

            itemBuilder: (context,index){
                return Card(
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return ListTile(
                        title: Text(items[index].name),
                        subtitle: Text(items[index].price.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            cart.add(items[index]);
                          }
                          , icon: const Icon(Icons.add),
                        ),


                      );
                    }
                  )
                );
            }
          ),

        ),
      )
    );
  }
}
