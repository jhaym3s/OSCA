import 'package:flutter/material.dart';
class CartItem {
  final String? title;
  final int? quantity;
  final String? id;
  final double? price;
  final String? image;

  CartItem({
     this.title,
     this.id,
     this.price,
     this.quantity,
     required this.image,
    });
}

class Cart with ChangeNotifier {

   Map<String, CartItem> _items ={};

  Map<String, CartItem> get items{
    return {..._items};
}
int get itemCount {
    return _items == null?0:_items.length;
}
double get totalAmount{
    double total =0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
}
  //used in the productItem.dart file
void addItem({String? productId, double? price, String? title, String? image}){
    if(items.containsKey(productId)){
      _items.update(productId!, (existingCartItem) => CartItem(title:existingCartItem.title ,
          id: existingCartItem.id, price: existingCartItem.price , 
          image: existingCartItem.image,
          quantity: existingCartItem.quantity!+1));
    }else {
      _items.putIfAbsent(productId!, () => CartItem(
          image:  image ,
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1));
    }
    notifyListeners();
  }
void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  void removeSingleProduct(String productId){
    // if(_items.containsKey(productId)){
    //   return;
    // }
    if(_items[productId]!.quantity!>1){
      _items.update(productId, (existingCartItem) =>
          CartItem(title: existingCartItem.title,
          id:existingCartItem.id,
          image: existingCartItem.image,
          price: existingCartItem.price,
          quantity:existingCartItem.quantity!-1)
      );
    }else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearProduct(){
     _items= {};
    notifyListeners();
  }

}