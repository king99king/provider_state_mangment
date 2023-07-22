import 'package:flutter/cupertino.dart';
import 'package:providerstate/Items.dart';


class Cart with ChangeNotifier {

  List<Item> _items = [];
  double _price = 0.0;

  void add(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }
  int get count {
    return _items.length;
  }
  double get totalPrice {
    return _price;
  }
  void clear() {
    _price = 0.0;
    _items.clear();
    notifyListeners();
  }
  void remove(Item item){
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }
  List<Item> get getItems {
    return _items;
  }


}

