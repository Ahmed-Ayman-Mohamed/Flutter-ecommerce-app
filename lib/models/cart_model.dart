import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {

  List _cartItems = [];

  get cartItems => _cartItems;

  void addItemToCartItems(String title,String image,double rating,double price){
    _cartItems.add([title,image,rating,price]);
    notifyListeners();
  }
  void removeItemFromCartItems(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  double calculateTotalPrice(){
    double totalPrice = 0;
    for(int i = 0; i < _cartItems.length; i++){
      totalPrice += _cartItems[i][3] - (_cartItems[i][3] * 0.30);
    }
    return totalPrice;
  }
}
