import 'package:flutter/material.dart';

enum Category{
  sweatShirt,
  stickers,
  tShirts,
  furniture,
  bags,
}
class Products with ChangeNotifier{
  final String? imagePath,id,productName,description;
  bool isFavourite;
  final double? price;
  final List? sizesAvailable;
  Category? category;
  //final String category;

  Products({this.imagePath,this.isFavourite = false,this.id, this.price, 
  this.productName,this.sizesAvailable,this.category,
    this.description = "2021 Osca fest theme shirt.",
  });

  toggleFavouriteStatus(){
    isFavourite = !isFavourite;
    notifyListeners();
  }
}


