import 'package:flutter/material.dart';

// class SearchBar extends ChangeNotifier {
//   bool serachbarEnabled = false;

//   void activateSerachbar() {
//     print("$serachbarEnabled");
//     serachbarEnabled = true;
//     notifyListeners();
//     print("in to the provider and $serachbarEnabled");
//   }
// }

class Items {
  final name;
  final price;
  final imagename;

  Items({required this.name, required this.price, required this.imagename});
}

class CartModel extends ChangeNotifier {
  final List<Items> _items = [];

  // int get totalPrice => FlutterCart().getTotalAmount();

  List<Items> get cartItems => _items; //get items from the cart

  int get listlength => _items.length; //get the length of list for builder

  // int get totalPrice => _items.fold(0,total,_items[index].price) => total + _items[index].price);

  double get totalPrice =>
      cartItems.fold(0, (total, current) => total + current.price);

  void add(Items item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Items item) {
    _items.remove(item);
    notifyListeners();
  }
}
